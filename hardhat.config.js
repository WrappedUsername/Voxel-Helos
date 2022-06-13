require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-etherscan");
require("@nomiclabs/hardhat-ethers");
require("dotenv").config();

module.exports = {
  solidity: "0.8.14",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    },
  networks: {
    networks: {
      hardhat: {
      },
      polygon: {
        url: "https://polygon-mainnet.infura.io/v3/${process.env.INFURA_API_KEY}",
        accounts: [process.env.PRIVATE_KEY]
      }
    },
  etherscan: {
    apiKey: process.env.ETHERSCAN_API_KEY
    },
  },
}
