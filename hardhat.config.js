require("@nomicfoundation/hardhat-toolbox")
require("dotenv").config()
require("@nomiclabs/hardhat-etherscan")
require("./tasks/block-number")
require("hardhat-gas-reporter")
require("solidity-coverage")

const COINMARKETCAP_API_KEY =
    process.env.COINMARKETCAP_API_KEY ||
    "https://eth-goerli.alchemyapi.io/someapikey"
const GOERLI_RPC_URL = process.env.GOERLI_RPC_URL || "Key"
const PRIVATE_KEY = process.env.PRIVATE_KEY || "0xKey"
const ETHERSCAN_API_KEY = process.env.ETHERSCAN_API_KEY || "Key"

module.exports = {
    defaultNetwork: "hardhat",
    networks: {
        hardhat: {},
        goerli: {
            url: GOERLI_RPC_URL,
            accounts: [PRIVATE_KEY],
            chainId: 5,
        },
        localhost: {
            url: "http://127.0.0.1:8545/",
            chainId: 31337,
        },
    },
    solidity: "0.8.13",
    etherscan: {
        apiKey: ETHERSCAN_API_KEY,
    },
    gasReporter: {
        enabled: true,
        currency: "USD",
        outputFile: "gas-report.txt",
        noColors: true,
        coinmarketcap: COINMARKETCAP_API_KEY,
        token: "MATIC",
    },
}
