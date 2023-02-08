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
    }
    mapping(address => Person) public people;

    address public _winnerAddress;
    uint public _winnerWeightLost;

    function addPerson(uint _weight) public {
        people[msg.sender] = Person(_weight, 0);
    }

    function theWeighing(uint _weightAfter) public {
        uint weightL = people[msg.sender]._weight - _weightAfter;
        people[msg.sender]._weightLost = weightL;
        isWinner(weightL);
    }

    function isWinner(uint _weightLost) internal {
        if (_winnerWeightLost < _weightLost) {
            _winnerWeightLost = _weightLost;
            _winnerAddress = msg.sender;
        }

        // winner.push(Winner(msg.sender, _weightLost)); //this function not working for now
    }
}
