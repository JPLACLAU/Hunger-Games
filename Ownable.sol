pragma solidity 0.8.13;
//SPDX-License-Identifier: UNLICENSED


contract Ownable {
    address public owner;

    modifier onlyOwner {
        require(msg.sender == owner);
        _;    //run the function
    }

    constructor (){
        owner = msg.sender;
    }
}