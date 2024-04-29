// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {SciToken} from "../src/SciToken.sol";

contract DeploySciToken is Script {

    uint256 public constant INITIAL_SUPPLY = 1000 ether;

    function run() external returns (SciToken){
        vm.startBroadcast();
        SciToken sciToken = new SciToken(INITIAL_SUPPLY);
        vm.stopBroadcast();
        return sciToken;
        }

  
    }
