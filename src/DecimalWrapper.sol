// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {DecimalLibrary} from "./libraries/DecimalLibrary.sol";

contract DecimalWrapper {
    using DecimalLibrary for uint8;

    function getBTCperETHDecimal() public view returns (uint8) {
        return DecimalLibrary.getBTCperETH_Decimal();
        // 18
    }

    function getBTCperUSDDecimal() public view returns (uint8) {
        return DecimalLibrary.getBTCperUSD_Decimal();
        // 8
    }

    function getETHperUSDDecimal() public view returns (uint8) {
        return DecimalLibrary.getETHperUSD_Decimal();
        // 8
    }

    function getEURperUSDDecimal() public view returns (uint8) {
        return DecimalLibrary.getEURperUSD_Decimal();
        // 8
    }

    function getGBPperUSDDecimal() public view returns (uint8) {
        return DecimalLibrary.getGBPperUSD_Decimal();
        // 8
    }

    function getLINKperETHDecimal() public view returns (uint8) {
        return DecimalLibrary.getLINKperETH_Decimal();
        // 18
    }

    function getLINKperUSDDecimal() public view returns (uint8) {
        return DecimalLibrary.getLINKperUSD_Decimal();
        // 8
    }

    function getUSDCperUSDDecimal() public view returns (uint8) {
        return DecimalLibrary.getUSDCperUSD_Decimal();
        // 8
    }
}
