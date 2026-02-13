// SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;

contract Constructor {

    // string public TokenName;
    // uint public TotalSupply;

    // Run at start
    // constructor(string memory name, uint number) {
    //     TokenName = name;
    //     TotalSupply = number;
    // }

    // With this function we can change the total supply
    // function set(uint number) public {
    //     TotalSupply = number;
    // }

    // If we want to set a non fungible value, we can use:
    // constant and immutable

    // uint public constant number2 = 22000000;

    // function set(uint num) public {
    //     number2 = num;
    // }

    // We get an error about the code piece above

    // Difference between constant and immutable is:
    // constant gets value when define but immutable can get value after define
    // uint public immutable number;

    // constructor(uint num) {
    //     number = num;
    // }

    address public  immutable owner;

    constructor() {
        owner = msg.sender;
    }
}