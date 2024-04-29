// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {SciToken} from "../src/SciToken.sol";
import {Test, console} from "lib/forge-std/src/Test.sol";
import {DeploySciToken} from "../script/DeploySciToken.s.sol";

contract SciTokenTest is Test {
    // state variables
    SciToken public sciToken;
    DeploySciToken public deployer;

    address manu = makeAddr("manu");
    address eva = makeAddr("eva");

    uint256 public constant INITIAL_BALANCE = 1000 ether;

    function setUp() public {
        deployer = new DeploySciToken();
        sciToken = deployer.run();

        vm.prank(msg.sender);
        sciToken.transfer(manu, INITIAL_BALANCE);

    }

    // test tokens have successfully been minted and transferred

    function testManuBalance() public view {
        assertEq(INITIAL_BALANCE, sciToken.balanceOf(manu));

    }

    function testAllowancesWork() public {
        uint256 initialAllowance = 1000;

        // manu approves eva to spend tokens on his behalf
        vm.prank(manu);
        sciToken.approve(eva, initialAllowance);

        uint256 transferAmount = 500;

        vm.prank(eva);
        sciToken.transferFrom(manu, eva, transferAmount);
        assertEq(transferAmount, sciToken.balanceOf(eva));
        assertEq(INITIAL_BALANCE - transferAmount, sciToken.balanceOf(manu));
        }

  /*  function testAllowanceFailOnInsufficientAllowance() public {
        uint256 initialAllowance = 500;
        uint256 transferAmount = 1000; // Exceeding allowance

        vm.prank(manu);
        sciToken.approve(eva, initialAllowance);

        vm.prank(eva);
        vm.expectRevert("ERC20: transfer amount exceeds allowance");
        sciToken.transferFrom(manu, eva, transferAmount);
    } */

    function testTransfer() public {
        uint256 transferAmount = 1000;
        vm.prank(manu);
        sciToken.transfer(eva, transferAmount);
        assertEq(transferAmount, sciToken.balanceOf(eva));
    }

    function testBalanceAfterTransfer() public {
        uint256 transferAmount = 1000;
        address receiver = eva;
        uint256 initialBalance = sciToken.balanceOf(manu);
        vm.prank(manu);
        sciToken.transfer(receiver, transferAmount);
        assertEq(initialBalance - transferAmount, sciToken.balanceOf(manu));

    }

    function testTransferFrom() public {
        uint256 Amount = 1000;
        address receiver = eva;
        vm.prank(manu);
        sciToken.approve(eva, Amount);
        vm.prank(eva);
        sciToken.transferFrom(manu, receiver, Amount);
        assertEq(Amount, sciToken.balanceOf(receiver));
    }


}