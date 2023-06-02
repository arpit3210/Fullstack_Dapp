pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract YourContract {

  event SetPurpose(address sender, string purpose);

  string public purpose = "Building Unstoppable Apps!!!";

address public owner;
  constructor() payable {
    owner=msg.sender;
    // what should we do on deploy?
  }

modifier onlyOwner()
{
  require(msg.sender== owner, "Invalid address: You are not the owner of this contract");
  _;
}

function CheckOwnerCanCall() view public onlyOwner returns(string memory)
{
  string memory message= "True : Yes you are the owner of this contract";
  return message;
}

function Addition(uint _x, uint _y) public pure returns(uint)
{
  return _x+_y;
}

  function setPurpose(string memory newPurpose) onlyOwner public payable {
      purpose = newPurpose;
      console.log(msg.sender,"set purpose to",purpose);
      emit SetPurpose(msg.sender, purpose);
  }

  // to support receiving ETH by default
  receive() external payable {}
  fallback() external payable {}
}
