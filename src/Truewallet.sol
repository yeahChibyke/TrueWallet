// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {TrueLibraryUSD} from "./libraries/TrueLibraryUSD.sol";
import {TrueLibraryETH} from "./libraries/TrueLibraryETH.sol";

contract TrueWallet {
    using TrueLibraryUSD for uint256;
    using TrueLibraryETH for uint256;

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

    function getETHperUSDPrice() public view returns (uint256) {
        return TrueLibraryUSD.getETHperUSD_Price();
    }

    function getBTCperUSDPrice() public view returns (uint256) {
        return TrueLibraryUSD.getBTCperUSD_Price();
    }

    function getEURperUSDPrice() public view returns (uint256) {
        return TrueLibraryUSD.getEURperUSD_Price();
    }

    function getGBPperUSDPrice() public view returns (uint256) {
        return TrueLibraryUSD.getGBPperUSD_Price();
    }

    function getLINKperUSDPrice() public view returns (uint256) {
        return TrueLibraryUSD.getLINKperUSD_Price();
    }

    function getUSDCperUSDPrice() public view returns (uint256) {
        return TrueLibraryUSD.getUSDCperUSD_Price();
    }
}
