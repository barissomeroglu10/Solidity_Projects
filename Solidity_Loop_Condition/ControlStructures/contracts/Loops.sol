// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract Loops {
    
    // Declare two arrays of fixed size 15 to store numbers
    uint256[15] public numbers0; // Used by the `ListByFor` function
    uint256[15] public numbers1; // Used by the `ListByWhile` function

    /**
     * @dev Populates the `numbers0` array using a `for` loop.
     * Each index will be set to its index value (0 to 14).
     */
    function ListByFor() public {
        
        // Create a memory copy of the `numbers0` array for manipulation
        uint256[15] memory nums = numbers0;

        // Use a `for` loop to iterate through the array
        for (uint256 i = 0; i < nums.length; i++) {
            
            // Example: Skip index 9 if uncommented
            // if (i == 9) continue;

            // Example: Exit the loop completely at index 9 if uncommented
            // if (i == 9) break;

            // Set the value of the current index to its index number
            nums[i] = i;
        }

        // Update the state array `numbers0` with the modified memory array
        numbers0 = nums;
    }

    /**
     * @dev Returns the contents of the `numbers0` array.
     * This is a view function and does not modify the blockchain state.
     * @return The `numbers0` array.
     */
    function GetArray0() public view returns (uint256[15] memory) {
        return numbers0;
    }

    /**
     * @dev Populates the `numbers1` array using a `while` loop.
     * Each index will be set to its index value (0 to 14).
     */
    function ListByWhile() public {
        
        uint256 i = 0; // Initialize a counter variable

        // Use a `while` loop to iterate until the end of the array
        while (i < numbers1.length) {
            
            // Set the value of the current index to its index number
            numbers1[i] = i;

            // Increment the counter to avoid an infinite loop
            i++;
        }
    }

    /**
     * @dev Returns the contents of the `numbers1` array.
     * This is a view function and does not modify the blockchain state.
     * @return The `numbers1` array.
     */
    function GetArray1() public view returns (uint256[15] memory) {
        return numbers1;
    }
}