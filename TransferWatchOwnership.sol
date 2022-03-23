//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract TransferWatchOwnership{

    address public currentWatchOwner;

    constructor() {
        currentWatchOwner = msg.sender;
    }

    modifier onlyCurrentOwner() {
        require (msg.sender == currentWatchOwner, "Only owner can set this function");
        _;
    }

    function setNewWatchOwner(address newWatchOwner) external onlyCurrentOwner {
        require (newWatchOwner != address(0), "Address not valid");
        currentWatchOwner = newWatchOwner;
    }

    function seeNewOwner() external view returns (address) {
        return currentWatchOwner;
    }
}