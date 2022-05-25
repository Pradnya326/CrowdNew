// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;

contract Crowd{
    address public poor;
    address public manager;
    uint total = 0;

    constructor  () {
        manager = msg.sender;
    }

    function registerPoor() public {
        poor = msg.sender;
    }

    function donate() public payable{ 
        require(msg.value > 100) ;      
        total += msg.value;
        
    }

    function distribute() public {
        require(msg.sender == manager);
        payable(poor).transfer(total);
        total = 0;
        
        
    }

    function getBalance() public view returns (uint){
        return total;
    }
}
