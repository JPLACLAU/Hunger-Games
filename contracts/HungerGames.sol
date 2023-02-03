// SPDX-License-Identifier: MIT
// 1. Pragma
pragma solidity ^0.8.17;

// 2. Imports
// 3. Interfaces, Libraries, Contracts
/* @title: "Hunger Games Smart Contract"
 * @author: "Jean-Paul Laclau"
 * @notice: "A contest between friends to loose weight"
 * @dev: "The person who lost more weight will win the funds in the contract"
 */
contract HungerGames {
    // Type Declarations
    // State variables

    uint256 public peopleCount = 0;

    mapping(uint => Person) public people;

    struct Person {
        uint _id;
        uint _weight;
        address payable _contestant;
        //If you weight 105,51kg, it'll be 10551
    }

    // Events
    // Modifiers
    // Functions Order:
    //// constructor

    //// receive

    function addPerson(
        uint _weight //If you weight 105,51kg, it'll be 10551
    ) public payable {
        require(msg.value == 1000000000000000000);
        uint _id = peopleCount + 1;
        address payable _contestant = payable(msg.sender);
        people[peopleCount] = Person(_id, _weight, _contestant);
        incrementCount();
    }

    //// fallback
    //// external
    //// public
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    //// internal
    function incrementCount() internal {
        peopleCount += 1;
    }

    //// private
    //// view / pure
}

/*  @param: Explain some param here.
 *  @notice: Write some short ending comentary here. Be nice.
 */
