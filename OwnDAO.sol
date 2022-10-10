// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract OwnDAO{
    address payable owner;
    constructor(){
        owner =payable( msg.sender);
    }

    struct Members{
        string name;
        address walletAddress;
        uint releaseTime;
        uint amount;

    }
    mapping(address => Members) allMembers;
    
    modifier isOwner(){
        require(owner == msg.sender , "You are not the owner");
        _;
    }






}