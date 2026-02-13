// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IfElse {
    
    // Store the hashed password securely
    bytes32 private hashedPassword;

    // Counter for successful login attempts
    uint256 private loginCount;

    // Constructor to initialize the hashed password
    constructor(string memory _password) {
        hashedPassword = keccak256(abi.encode(_password));
    }

    /*
     * @dev Allows a user to log in by providing a password.
     * Increments the login count if the password is correct.
     * @param _password The plaintext password provided by the user.
     * @return A boolean indicating whether the login was successful.
     */
     
    function login(string memory _password) public returns (bool) {
        if (hashedPassword == keccak256(abi.encode(_password))) {
            loginCount++; // Increment the login count
            return true; // Login successful
        } else {
            return false; // Login failed
        }
        
        // Alternatively, we could use:
        // return (hashedPassword == keccak256(abi.encode(_password)));
    }

    /*
     * @dev Returns a status code (1 for success, 0 for failure) based on the login attempt.
     * This function is view-only and does not modify state.
     * @param _password The plaintext password provided by the user.
     * @return A status code: 1 for success, 0 for failure.
     */

    function loginStatusCode(string memory _password) public view returns (uint256) {
        if (hashedPassword == keccak256(abi.encode(_password))) {
            return 1; // Password is correct
        } else {
            return 0; // Password is incorrect
        }

        // Alternatively, we could use a ternary operator:
        // return (hashedPassword == keccak256(abi.encode(_password)) ? 1 : 0);
    }

    /*
     * @dev Returns the login status based on the number of successful logins.
     * - 0: No logins yet.
     * - 1: More than one successful login.
     * - 2: Exactly one successful login.
     * - 3: Any unexpected condition (should not happen).
     * @return A status code based on the login count.
     */

    function loginStatus() public view returns (uint256) {
        if (loginCount == 0) {
            return 0; // No logins yet
        } else if (loginCount > 0 && loginCount != 1) {
            return 1; // Multiple successful logins
        } else if (loginCount == 1) {
            return 2; // Exactly one successful login
        } else {
            return 3; // Unexpected condition
        }
    }

    /*
        Logical operators in Solidity:
        - `&&`: AND operator (e.g., true && false -> false)
        - `||`: OR operator (e.g., true || false -> true)
        - Comparison operators: >, <, >=, <=
    */
}