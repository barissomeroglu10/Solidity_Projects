// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.2;

contract Functions {
    // State variable to store the lucky number
    uint LuckyNumber = 10;

    // Public view function to return the current value of LuckyNumber
    function ShowNumber() public view returns (uint) {
        return LuckyNumber;
    }

    // Public function to update the value of LuckyNumber
    function SetNumber(uint newNumber) public {
        LuckyNumber = newNumber;
    }

    /*
     * Pure functions do not read or modify state variables.
     * This function returns multiple values, with named return variables for clarity.
     */
    function nothing() public pure returns (uint x, bool y, bool z) {
        x = 6;
        y = true;
        z = true;
    }

    // Another state variable
    uint a = 3;

    // View function to return the value of 'a'
    function viewA() public view returns (uint) {
        return a;
    }

    /*
     * Incorrectly marked as view since it does not only "view" the state
     * (no state changes happen, but marking it as pure is better for clarity).
     */
    function setA() public view returns (uint) {
        return a;
    }

    // View function with parameters; adds 'a' to the input parameter 'y'
    function Sum(uint y) public view returns (uint) {
        return a + y;
    }

    /*
     * Example of a view function that uses a global variable 'block.timestamp'.
     * block.timestamp gives the current block's timestamp in seconds.
     */
    function Add(uint m, uint n) public view returns (uint) {
        return m + n + block.timestamp;
    }

    /*
     * Pure function: performs addition without interacting with state variables or blockchain data.
     */
    function Add2(uint m, uint n) public pure returns (uint) {
        return m + n;
    }

    // Function demonstrating the use of another public function within a pure function
    function Add3(uint m, uint n) public pure returns (uint) {
        return m + n;
    }

    // Pure function that calls another pure public function (Add3)
    function Add4(uint k, uint l) public pure returns (uint) {
        return Add3(k, l);
    }

    /*
     * Public function: can be called externally or internally.
     * This function returns a hardcoded string.
     */
    function PublicKeyword() public pure returns (string memory) {
        return "This is a public function";
    }

    /*
     * Calls another public function internally.
     */
    function callPublicKeyword() public pure returns (string memory) {
        return PublicKeyword(); // Calls PublicKeyword
    }

    /*
     * Private function: can only be accessed within this contract.
     */
    function PrivateKeyword() private pure returns (string memory) {
        return "This is a private function";
    }

    /*
     * Demonstrating how a private function can be accessed within the same contract
     * through a public function.
     */
    function PublicKeyword2() public pure returns (string memory) {
        return PrivateKeyword();
    }

    /*
     * Internal function: like private but accessible in derived contracts (inheritance).
     */
    function InternalKeyword() internal pure returns (string memory) {
        return "This is an internal function";
    }

    /*
     * Demonstrates access to an internal function via a public function.
     */
    function PublicKeyword3() public pure returns (string memory) {
        return InternalKeyword();
    }

    /*
     * External function: can only be called externally, not from within the contract itself.
     */
    function ExternalCall() external pure returns (string memory) {
        return "This is an external function";
    }

    /*
     * Attempting to call an external function from within the contract results in an error.
     * Uncommenting the line below would cause a compilation error.
     */
    function PublicKeyword4() public pure returns (string memory) {
        // return ExternalKeyword(); // This line is invalid
        return "Cannot call an external function here!";
    }
}
