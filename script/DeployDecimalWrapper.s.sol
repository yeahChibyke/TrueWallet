// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {DecimalWrapper} from "../src/DecimalWrapper.sol";
import {Script} from "forge-std/Script.sol";

contract DeployDecimalWrapper is Script {
    function run() external returns (DecimalWrapper) {
        vm.startBroadcast();
        DecimalWrapper decimalWrapper = new DecimalWrapper();
        vm.stopBroadcast();
        return decimalWrapper;
    }
}
