// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";
contract OwnDAO{
    address payable owner;
    constructor(){
        owner =payable( msg.sender);
    }
    using SafeMath for uint256;

    event FundingRecievedLog(uint amount , address walletAddress);

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
    modifier isAddressPresent(address _walletAddress){
        require(!(allMembers[_walletAddress].releaseTime > 0) , "This wallet has already been created!");
        _;
    }


    function addMember(string memory _name , address _walletAddress ,  uint _amount)public isAddressPresent(_walletAddress) {
        
        allMembers[_walletAddress] = Members( _name ,  _walletAddress, (block.timestamp + 100) ,  _amount);
    }

    function balanceOfContract() public view returns(uint){
        return address(this).balance;
    }

    function depositAmount(uint _amount , address walletAddress ) public isAddressPresent(walletAddress) {
      allMembers[walletAddress].amount = allMembers[walletAddress].amount.add(_amount);

    }






}