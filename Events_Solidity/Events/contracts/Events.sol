// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract Events {

    // Modifiers are used to apply predefined checks or actions before or after a function execution.

    // Enum to represent order statuses
    enum Status {Taken, Preparing, Boxed, Shipped} 
    
    // Struct to represent an order
    struct Order {
        address customer; // Address of the customer
        string ZipCode;   // Delivery zip code
        uint256[] products; // List of product IDs
        Status status;    // Current status of the order
    }

    Order[] public orders; // Array to store all orders
    address public owner;  // Address of the contract owner
    uint256 public txCount; // Transaction count tracker

    // Fonksiyonların üzerinde event tanımı tercih ediliyor
    // Indexed: eğer bir events'da bir değişkeni index olarak belirlersem, sonrasında blockchainde bu index değerlerini sorgulayabilirim
    // event kullanmak için emit keyword'unu kullanmak gerekir
    event OrderCreated(uint256 _orderId, address indexed _consumer);

    event ZipChanged(uint256 _orderId, string _zipCode);

    // Constructor to set the contract owner
    constructor() {
        owner = msg.sender;
    }

    // Function to create a new order
    function CreateOrder(string memory _zipCode, uint256[] memory _products) checkProducts(_products) incTx external returns (uint256) 
    {
        Order memory order; // Temporary order object in memory
        
        // Assign order details
        order.customer = msg.sender;
        order.ZipCode = _zipCode;
        order.products = _products;
        order.status = Status.Taken;

        orders.push(order); // Store the new order in the orders array

        emit OrderCreated(orders.length - 1, msg.sender);

        return orders.length - 1; // Return the index of the created order
    }

    // Function to advance the status of an order
    function AdvanceOrder(uint256 _orderId) 
        checkOrderId(_orderId) 
        onlyOwner 
        public 
    {
        Order storage order = orders[_orderId]; // Fetch the order in storage

        require(order.status != Status.Shipped, "Order is already shipped."); // Ensure the order is not already completed

        // Transition to the next order status
        if (order.status == Status.Taken) {
            order.status = Status.Preparing;
        } else if (order.status == Status.Preparing) {
            order.status = Status.Boxed;
        } else if (order.status == Status.Boxed) {
            order.status = Status.Shipped;
        }
    }

    // Function to get order details by ID
    function GetOrder(uint256 _orderId) 
        checkOrderId(_orderId) 
        external 
        view 
        returns (Order memory) 
    {
        return orders[_orderId]; // Return the requested order
    }

    // Function to update the zip code of an order
    function UpdateZip(uint256 _orderId, string memory _zip) checkOrderId(_orderId) onlyCustomer(_orderId) incTx external 
    {
        Order storage order = orders[_orderId]; // Fetch the order in storage
        order.ZipCode = _zip; // Update the zip code

        emit ZipChanged(_orderId, _zip);
    }

    // Modifier to check if the product list is valid
    modifier checkProducts(uint256[] memory _products) {
        require(_products.length > 0, "No products."); // Ensure the product list is not empty
        _;
    }

    // Modifier to validate the order ID
    modifier checkOrderId(uint256 _orderId) {
        require(_orderId < orders.length, "Not a valid order id."); // Ensure the order ID exists
        _;
    }

    // Modifier to increment the transaction count after execution
    modifier incTx {
        _; // Execute the function first
        txCount++; // Increment transaction count
    }

    // Modifier to allow only the contract owner
    modifier onlyOwner {
        require(owner == msg.sender, "You are not authorized"); // Ensure the caller is the owner
        _;
    }

    // Modifier to allow only the customer who placed the order
    modifier onlyCustomer(uint256 _orderId) {
        require(orders[_orderId].customer == msg.sender, "You are not the owner of the order."); // Ensure the caller owns the order
        _;
    }
}