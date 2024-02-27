// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {TrueWallet} from "../src/Truewallet.sol";
import {Test, console2} from "forge-std/Test.sol";
import {DeployTrueWallet} from "../script/DeployTrueWallet.s.sol";

contract TrueWalletTest is Test {
    TrueWallet trueWallet;
    address payable i_TrueOwner;

    function setUp() external {
        i_TrueOwner = payable(msg.sender);
        DeployTrueWallet deployTrueWallet = new DeployTrueWallet();
        // trueWallet = new TrueWallet();
        trueWallet = deployTrueWallet.run();
    }

    function testTrueOwnerIsMsgSender() public {
        console2.log(trueWallet.i_TrueOwner());
        console2.log(msg.sender);
        console2.log(address(this));

        assertEq(trueWallet.i_TrueOwner(), msg.sender);
    }

    function testInitialOwner() public {
        assertEq(trueWallet.i_TrueOwner(), i_TrueOwner);
    }

    function testBalance() public {
        assertEq(trueWallet.getBalance(), address(trueWallet).balance);
    }

    function testReceiveETH() public {
        // initial balance
        uint256 initialBalance = address(trueWallet).balance;

        // send 1 ether to TrueWallet contract
        (bool sent, ) = address(trueWallet).call{value: 1 ether}("");
        require(sent, "Failed to send ETH!");

        // final balance
        uint256 finalBalance = address(trueWallet).balance;

        // assert
        assertEq(
            finalBalance,
            initialBalance + 1 ether,
            "Balance did not increase by 1 ETH!"
        );
    }

    function testWithdrawByOwner() public {
        (bool sent, ) = address(trueWallet).call{value: 1 ether}("");
        require(sent, "Failed to send ETH!");

        uint256 initialBalance = i_TrueOwner.balance;

        vm.prank(i_TrueOwner);
        trueWallet.withdraw(1 ether);

        assertEq(i_TrueOwner.balance, initialBalance + 1 ether);
    }

    function testWithdrawByNonOwnerShouldFail() public {
        (bool sent, ) = address(trueWallet).call{value: 1 ether}("");
        require(sent, "Failed to send ETH!");

        address nonOwner = address(0x1);

        vm.prank(nonOwner);
        vm.expectRevert("caller is not trueOwner");
        trueWallet.withdraw(1 ether);
        vm.stopPrank();
    }

    function testWithdrawMoreThanBalanceShouldFail() public {
        (bool sent, ) = address(trueWallet).call{value: 0.5 ether}("");
        require(sent, "Failed to send ETH!");

        vm.prank(i_TrueOwner);
        vm.expectRevert();
        trueWallet.withdraw(1 ether);
    }
}
