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

    

    function addMember(string memory _name , address _walletAddress ,  uint _amount)public {
        require(!(allMembers[_walletAddress].releaseTime > 0) , "This wallet has already been created!");
        allMembers[_walletAddress] = Members( _name ,  _walletAddress, (block.timestamp + 100) ,  _amount);
    }






}