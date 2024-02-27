// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20; // Updated to a secure version of Solidity

import {TrueLibraryUSD} from "./libraries/TrueLibraryUSD.sol";
import {TrueLibraryBTC} from "./libraries/TrueLibraryBTC.sol";

contract TrueWallet {
    using TrueLibraryUSD for uint256;
    using TrueLibraryBTC for uint256;

    address payable public trueOwner;
    uint256 private contractBalance;

    constructor() {
        trueOwner = payable(msg.sender);
    }

    receive() external payable {
        contractBalance += msg.value; // Update contract balance on Ether received
    }

    function withdraw(uint256 amount) external {
        require(msg.sender == trueOwner, "Caller is not the owner");
        require(amount <= contractBalance, "Insufficient balance");

        contractBalance -= amount; // Update contract balance before transfer
        (bool sent, ) = trueOwner.call{value: amount}("");
        require(sent, "Failed to send Ether");
    }

    function getBalance() external view returns (uint256) {
        return contractBalance;
    }

    function getBalanceInUSD() external view returns (uint256) {
        uint256 ethInUSD = TrueLibraryUSD.getETHperUSD_Price();
        uint256 usdBal = (ethInUSD * contractBalance) / 1e18;
        return usdBal;
    }

    function getBalanceInBTC() external view returns (uint256) {
        uint256 ethInBTC = TrueLibraryBTC.getETHperBTC_Price();
        uint256 btcBal = (ethInBTC * contractBalance) / 1e18;
        return btcBal;
    }
}
