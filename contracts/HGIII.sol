// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

/* @title: "Hunger Games Smart Contract"
 * @author: "Jean-Paul Laclau"
 * @notice: "A contest between friends to loose weight"
 * @dev: "The person who lost more weight will win the funds in the contract"
 * ALSO: this is another way of executing the original idea, it is a mix of "elisma" sugestions with new optimizing gas ideas.
 */

contract HungerGames {
    struct Person {
        uint _weight;
        uint _weightLost;
        bool _winner; //tengo que ver lo que aprendi en cz
    }
    mapping(address => Person) public people;

    struct Winner {
        address winnerAddress;
        uint _weightLost;
    }

    Winner[] public winner;

    function addPerson(uint _weight) public {
        people[msg.sender] = Person(_weight, 0);
    }

    function theWeighing(uint _weightAfter) public {
        people[msg.sender]._weightLost =
            people[msg.sender]._weight -
            _weightAfter;
    }

    function isWinner(uint _weightLost) public {
        // winner.push(Winner(msg.sender, _weightLost)); //this function not working for now
    }
}
