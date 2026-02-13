// SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;

contract Variables {

    // Rules to define variables
    // type name = value;

    // Fixed size types
    bool isTrue = false;

    int8 number = 12; // int256 --> -2^256 and 2^256
    uint number2 = 12; // uint --> 0 and 2^256

    address myAddress = 0x057259A97b2B2b3C4A3b6ba0Db07b0E7EB9b6979;

    bytes32 name1 = "Baris Someroglu";

    // Dynamic size types
    string name2 = "Baris Someroglu 10";

    bytes name3 = "BTC";

    uint[] array = [1, 2, 3, 4, 5];

    mapping(uint => address) list;

    // User defined value type

    struct Human{
        uint UID;
        string name;
        uint age;
        address Location;
    }

    Human Person1;
    // Person1.Location
    // Person1.age = 20;
    // Person1.name = "Baris";
    // Person1.UID = "123456789";

    enum TrafficLight {red, yellow, green}

    // State variables
    string public myName = "Baris Someroglu";

    function show() public pure returns(uint) {
        // Local variables
        uint number4 = 10;

        return number4;
    }

    function show2() public view returns(uint) {
        // Global variables
        // block.difficulty;
        block.gaslimit;
        block.timestamp;
        msg.sender;

        return block.number;
    }

    function show3() public view returns(address) {
        // msg.value;
        msg.data;

        return msg.sender;
    }
}
