// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {TrueLibraryUSD} from "./libraries/TrueLibraryUSD.sol";
import {TrueLibraryBTC} from "./libraries/TrueLibraryBTC.sol";

contract TrueWallet {
    using TrueLibraryUSD for uint256;
    using TrueLibraryBTC for uint256;

    address payable public trueOwner;

    constructor() {
        trueOwner = payable(msg.sender);
    }

    receive() external payable {}

    function withdraw(uint256 _amount) external {
        require(msg.sender == trueOwner, "caller is not trueOwner");
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    function getBalanceInUSD() external view returns (uint256) {
        uint256 ethInUSD = TrueLibraryUSD.getETHperUSD_Price();
        uint256 ethBal = address(this).balance;
        uint256 usdBal = (ethInUSD * ethBal) / 1e18;
        return usdBal;
    }

    function getBalanceInBTC() external view returns (uint256) {
        uint256 ethInBTC = TrueLibraryBTC.getETHperBTC_Price();
        uint256 ethBal = address(this).balance;
        uint256 btcBal = (ethInBTC * ethBal) / 1e18;
        return btcBal;
    }
}
