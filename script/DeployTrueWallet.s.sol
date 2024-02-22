// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {TrueWallet} from "../src/Truewallet.sol";
import {Script} from "forge-std/Script.sol";

contract DeployTrueWallet is Script {
    function run() external returns (TrueWallet) {
        vm.startBroadcast();
        TrueWallet trueWallet = new TrueWallet();
        vm.stopBroadcast();
        return trueWallet;
    }
}
