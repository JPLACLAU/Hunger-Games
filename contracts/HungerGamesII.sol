// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

/* @title: "Hunger Games Smart Contract"
 * @author: "Jean-Paul Laclau"
 * @notice: "A contest between friends to loose weight"
 * @dev: "The person who lost more weight will win the funds in the contract"
 * ALSO: this is another way of executing the original idea.
 */

contract HungerGames {


    mapping(address => Startingweight) public startingweights;

    function addStartingweight(uint Startingweight) public {
        startingweights[msg.sender] = uint Startingweight;
    }

    function getStartingweight() public view return (uint) {
        return startingweights[msg.sender];

    }


}

/*  @param: Explain some param here.
 *  @notice: Write some short ending comentary here. Be nice.
 */
