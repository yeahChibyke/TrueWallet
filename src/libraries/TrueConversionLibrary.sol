// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {TrueLibraryUSD} from "./TrueLibraryUSD.sol";
import {TrueLibraryBTC} from "./TrueLibraryBTC.sol";

library TrueConversionLibrary {
    // convert ETH to USD
    function ETH2USD(uint256 value) internal view returns (uint256) {
        uint256 ethPrice = TrueLibraryUSD.getETHperUSD_Price();
        uint256 ethAmountInUSD = (ethPrice * value);
        return ethAmountInUSD;
    }

    // convert ETH to BTC
    function ETH2BTC(uint256 value) internal view returns (uint256) {
        uint256 ethPrice = TrueLibraryBTC.getETHperBTC_Price();
        uint256 ethAmountInBTC = (ethPrice * value);
        return ethAmountInBTC;
    }
}
