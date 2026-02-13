// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

// Contract demonstrating usage of mapping and nested mapping in Solidity
contract Mapping {

    // A mapping is used to associate key-value pairs, similar to a hash table or dictionary.
    // In Solidity, mappings are primarily used to efficiently store data relationships, 
    // such as linking user addresses to specific values or statuses.

    // Default values: A mapping's value defaults to the initial value of the value type.

    // Mapping to track whether an address is registered (key: address, value: bool)
    mapping(address => bool) public registered;

    // Mapping to store a favorite number for each address (key: address, value: int256)
    mapping(address => int256) public favNums;

    // Function to register a user with their favorite number
    function registerUser(int256 _favNum) public {
        // Ensure the caller is not already registered
        require(!registered[msg.sender], "Already registered.");
        
        // Mark the caller as registered
        registered[msg.sender] = true;

        // Store the user's favorite number
        favNums[msg.sender] = _favNum;
    }

    // Function to check if the caller is registered
    function isRegistered() public view returns (bool) {
        // Return the registration status of the caller
        return registered[msg.sender];
    }

    // Function to delete the registration of the caller
    function DeleteRegistered() public {
        // Ensure the caller is registered
        require(isRegistered(), "User isn't logged in.");
        
        // Remove the caller's registration
        delete registered[msg.sender];
        
        // Delete the user's favorite number
        delete favNums[msg.sender];
    }
}

// Contract demonstrating nested mappings in Solidity
contract NestedMapping {

    // A nested mapping to represent debts between addresses
    // The first key (address) is the lender, and the second key (address) is the borrower
    // The value (uint256) represents the amount owed
    mapping(address => mapping(address => uint256)) public debts;

    // Function to record a debt owed by a borrower to the caller
    function inDebt(address _borrower, uint256 _amount) public {
        // Increment the borrower's debt to the caller by the specified amount
        debts[msg.sender][_borrower] += _amount;
    }

    // Function to repay a debt
    function outDebt(address _borrower, uint256 _amount) public {
        // Ensure the borrower owes enough debt to be repaid
        require(debts[msg.sender][_borrower] >= _amount, "Not enough debt.");

        // Reduce the borrower's debt to the caller by the specified amount
        debts[msg.sender][_borrower] -= _amount;
    }

    // Function to view the debt owed by a borrower to the caller
    function getDebt(address _borrower) public view returns (uint256) {
        // Return the amount of debt owed
        return debts[msg.sender][_borrower];
    }
}