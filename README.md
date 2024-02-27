# TrueWallet

**TrueWallet is a sophisticated, blockchain-powered wallet designed to securely manage your cryptocurrency assets. Built with Solidity and leveraging the Foundry development environment, TrueWallet provides a robust platform for handling Ethereum (ETH), Bitcoin (BTC), and USD. It's tailored for users seeking a secure and versatile digital currency management solution.**

Features include:

-   **Secure Asset Management**: Utilizes advanced cryptographic techniques to ensure the security of your digital assets.
-   **Exclusive Owner Access**: Implements strict authentication to guarantee that only the designated owner can access the wallet functionalities.
-   **Effortless Withdrawals**: Facilitates easy withdrawal of assets.
-   **Real-Time Balances**: Offers up-to-the-minute balance information in ETH, BTC, and USD, reflecting the latest market dynamics.

## Getting Started 

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Before you begin, ensure you have Foundry installed. Foundry can be installed with the following command:

```shell
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

### Installation

- Clone the repository

```shell
git clone https://github.com/yeahChibyke/TrueWallet.git
cd TrueWallet 
```

- Install dependencies using Forge

```shell
$ forge install
```

- Compile the contracts

```shell
$ forge build
```

### Test

Run the tests to ensure everything is set up correctly

```shell
$ forge test
```

## Usage

After compiling the contracts, you can deploy TrueWallet to your preferred network using Forge and interact with it using Cast, another tool from the Foundry suite.

### Deploying with Forge

```shell
$ forge script script/DeployTrueWallet.s.sol --rpc-url <your_rpc_url> --private-key <your_private_key> --broadcast
```

### Interacting with TrueWallet

You can use `cast` to interact with the deployed contract. For example, to check the balance of the contract, replace `<contract_address>` with your TrueWallet contract address:

```shell
cast call <contract_address> "getBalance()" --rpc-url <your_rpc_url>
```

## Contributing

If you'd like to contribute, please fork the repository and create a pull request with your changes.

## Contact

Email: chibykepride@gmail.com  
Github: yeahChibyke
