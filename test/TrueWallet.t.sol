// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {TrueWallet} from "../src/Truewallet.sol";
import {Test, console2} from "forge-std/Test.sol";
import {DeployTrueWallet} from "../script/DeployTrueWallet.s.sol";

contract TrueWalletTest is Test {
    TrueWallet trueWallet;
    address payable trueOwner;

    function setUp() external {
        trueOwner = payable(msg.sender);
        DeployTrueWallet deployTrueWallet = new DeployTrueWallet();
        // trueWallet = new TrueWallet();
        trueWallet = deployTrueWallet.run();
    }

    /*function setUp() external {
        // Pick an external account address to be the true owner
        address externalTrueOwner = address(1); // Example address, choose as needed

        // Simulate deploying the contract from the external true owner's address
        vm.startPrank(externalTrueOwner);
        trueWallet = new TrueWallet();
        vm.stopPrank();

        // Now, trueOwner of trueWallet should be externalTrueOwner
        trueOwner = payable(externalTrueOwner);
    }*/

    function testTrueOwnerIsMsgSender() public {
        console2.log(trueWallet.trueOwner());
        console2.log(msg.sender);
        console2.log(address(this));

        // assertEq(trueWallet.trueOwner(), address(this));
        assertEq(trueWallet.trueOwner(), msg.sender);
    }

    function testInitialOwner() public {
        assertEq(trueWallet.trueOwner(), trueOwner);
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

    function testReceiveFunds() public {
        payable(address(trueWallet)).transfer(1 ether);
        assertEq(address(trueWallet).balance, 1 ether);
    }

    // this particular test keeps failing. I have done everything I can think of
    function testWithdrawByOwner() public {
        payable(address(trueWallet)).transfer(1 ether);
        uint256 initialBalance = trueOwner.balance;

        vm.prank(trueOwner);
        trueWallet.withdraw(1 ether);

        assertEq(trueOwner.balance, initialBalance + 1 ether);
    }

    function testWithdrawByNonOwnerShouldFail() public {
        payable(address(trueWallet)).transfer(1 ether);
        address nonOwner = address(0x1);

        vm.prank(nonOwner);
        vm.expectRevert("caller is not trueOwner");
        trueWallet.withdraw(1 ether);
        vm.stopPrank();
    }

    function testWithdrawMoreThanBalanceShouldFail() public {
        payable(address(trueWallet)).transfer(0.5 ether);
        vm.prank(trueOwner);
        vm.expectRevert();
        trueWallet.withdraw(1 ether);
    }
}
