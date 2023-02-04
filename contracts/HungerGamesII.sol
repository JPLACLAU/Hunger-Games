// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

/* @title: "Hunger Games Smart Contract"
 * @author: "Jean-Paul Laclau"
 * @notice: "A contest between friends to loose weight"
 * @dev: "The person who lost more weight will win the funds in the contract"
 * ALSO: this is another way of executing the original idea.
 */

contract HungerGames {
    mapping(address => uint) public startingweights;
    mapping(address => uint) public lostweights;

    function addStartingweight(uint _startingweight) public {
        startingweights[msg.sender] = _startingweight;
    }

    function getStartingweight() public view returns (uint) {
        return startingweights[msg.sender];
    }

    function addendingweight(uint _endingweight) public {
        uint startingweight = startingweights[msg.sender];

        uint lostweight = startingweight - _endingweight;

        lostweights[msg.sender] = lostweight;
    }

    function getlostweight() public view returns (uint) {
        return lostweights[msg.sender];
    }
}

/*  @param: Explain some param here.
 *  @notice: Write some short ending comentary here. Be nice.
 */
