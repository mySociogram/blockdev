require('dotenv').config();
require('@nomiclabs/hardhat-waffle');
require("@nomiclabs/hardhat-etherscan");

const PRIVATE_KEY = process.env.WALLET_PRIVATE_KEY;
const API_KEY = process.env.FANTOM_API_KEY;
const REPORT_GAS = process.env.REPORT_GAS || false

module.exports = {
  solidity: '0.8.9',
  settings: {
    optimizer: {
      enabled: true,
      runs: 200
    }
  },
  networks: {
    mainnet: {
      url: `https://rpcapi.fantom.network`,
      chainId: 250,
      accounts: [PRIVATE_KEY]
    },
    testnet: {
      url: `https://rpc.testnet.fantom.network`,
      chainId: 4002,
      accounts: [PRIVATE_KEY]
    },
    coverage: {
      url: 'http://localhost:8555'
    },
    localhost: {
      url: `http://127.0.0.1:8545`
    }
  },
  etherscan: {
    apiKey: {
      ftmTestnet: API_KEY,
      opera: API_KEY
    }
  },
  gasReporter: {
    enabled: REPORT_GAS,
    currency: "USD",
    outputFile: "gas-report.txt",
    noColors: false,
    coinmarketcap: process.env.COINMARKETCAP_API_KEY,
  },
  contractSizer: {
    runOnCompile: true,
    only: ["Governance"],
  }
};