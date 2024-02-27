// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {TrueLibraryUSD} from "./libraries/TrueLibraryUSD.sol";
import {TrueLibraryBTC} from "./libraries/TrueLibraryBTC.sol";

error TrueWallet__NotTrueOwner();

contract TrueWallet {
    using TrueLibraryUSD for uint256;
    using TrueLibraryBTC for uint256;

    address payable public immutable i_TrueOwner;
    uint256 private contractBalance;

    constructor() {
        i_TrueOwner = payable(msg.sender);
    }

    receive() external payable {
        contractBalance += msg.value;
    }

    function withdraw(uint256 amount) external onlyTrueOwner {
        require(amount <= contractBalance, "Insufficient balance");

        contractBalance -= amount; // Update contract balance before transfer
        (bool sent, ) = i_TrueOwner.call{value: amount}("");
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

    modifier onlyTrueOwner() {
        if (msg.sender != i_TrueOwner) {
            revert TrueWallet__NotTrueOwner();
        }
        _;
    }
}
