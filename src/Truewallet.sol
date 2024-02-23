// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {TrueLibrary} from "./TrueLibrary.sol";

contract TrueWallet {
    using TrueLibrary for uint256;

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
}
