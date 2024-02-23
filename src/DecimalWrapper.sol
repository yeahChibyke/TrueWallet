// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {DecimalLibrary} from "./DecimalLibrary.sol";

contract DecimalWrapper {
    using DecimalLibrary for uint8;

    function getBTCperETHDecimal() public view returns (uint8) {
        return DecimalLibrary.getBTCperETH_Decimal();
    }

    function getBTCperUSDDecimal() public view returns (uint8) {
        return DecimalLibrary.getBTCperUSD_Decimal();
    }

    function getETHperUSDDecimal() public view returns (uint8) {
        return DecimalLibrary.getETHperUSD_Decimal();
    }

    function getEURperUSDDecimal() public view returns (uint8) {
        return DecimalLibrary.getEURperUSD_Decimal();
    }

    function getGBPperUSDDecimal() public view returns (uint8) {
        return DecimalLibrary.getGBPperUSD_Decimal();
    }

    function getLINKperETHDecimal() public view returns (uint8) {
        return DecimalLibrary.getLINKperETH_Decimal();
    }

    function getLINKperUSDDecimal() public view returns (uint8) {
        return DecimalLibrary.getLINKperUSD_Decimal();
    }

    function getUSDCperUSDDecimal() public view returns (uint8) {
        return DecimalLibrary.getUSDCperUSD_Decimal();
    }
}
