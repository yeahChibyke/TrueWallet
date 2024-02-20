// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {TrueWallet} from "../src/Truewallet.sol";
import {Test, console2} from "forge-std/Test.sol";

contract TrueWalletTest is Test {
    TrueWallet trueWallet;

    function setUp() external {
        trueWallet = new TrueWallet();
    }

    function testTrueOwnerIsMsgSender() public {
        console2.log(trueWallet.trueOwner());
        console2.log(msg.sender);
        console2.log(address(this));

        assertEq(trueWallet.trueOwner(), address(this));
    }

    function testInitialBalanceIsZero() public {
        assertEq(trueWallet.getBalance(), 0);
    }
}
