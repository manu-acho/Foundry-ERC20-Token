# SciToken Project

## Overview
The SciToken project provides an ERC20 token implementation using Solidity and the OpenZeppelin library. The `SciToken` is designed to be a simple, fungible cryptocurrency named "SciToken" with the symbol "SCI". The token features an initial supply mechanism and deployment and testing scripts that facilitate development and testing workflows using Foundry.

## Features
- **ERC20 Token**: Implements the ERC20 token standard.
- **Initial Minting**: Tokens are initially minted to the deployer's address.
- **Script for Deployment**: Easy deployment of the contract on Ethereum networks.
- **Comprehensive Testing**: Includes tests for various token functionalities such as transfers and allowances using Foundry's test environment.

## Prerequisites
- [Node.js](https://nodejs.org/) (recommended version 14.x or higher)
- [Foundry](https://github.com/foundry-rs/foundry)
  - Install Foundry using the official [installation guide](https://book.getfoundry.sh/getting-started/installation.html).

## Installation
To set up the development environment for SciToken, follow these steps:
1. Clone the repository:
   ```sh
   git clone https://github.com/yourrepository/SciToken.git
   cd SciToken

2. Install Foundry:
    ```sh
    curl -L https://foundry.paradigm.xyz | bash
    foundryup

3. Compile the contracts
    ```sh
    forge build

## Usage
# Deploying the Contract
To deploy the SciToken contract to a local testnet, run:
```sh
forge script DeploySciToken --fork-url <RPC_URL> --private-key <YOUR_PRIVATE_KEY> --broadcast
```
Replace <RPC_URL> and <YOUR_PRIVATE_KEY> with your Ethereum node RPC URL and private key, respectively.

# Running Tests
Execute the tests to ensure the contract operates correctly:

```sh
forge test
```
## Contract Functionality

    Minting: Tokens are initially minted to the deployer's address with the ability to transfer to other addresses.
    Transfers: Standard ERC20 transfer capabilities.
    Approvals and Allowances: Supports ERC20 approve and transferFrom functionalities to enable delegated spending.

## Smart Contracts

   1. SciToken.sol: Implementation of the SciToken, an ERC20 token.
   2. DeploySciToken.s.sol: Script for deploying SciToken on Ethereum networks.
   3. SciTokenTest.sol: Tests for basic functionalities of SciToken.

## Contributing

Contributions to the SciToken project are welcome. Please ensure that your code adheres to the existing code standards and include tests for new features.


## Licence
This project is licensed under the MIT License - see the LICENSE file for details.




