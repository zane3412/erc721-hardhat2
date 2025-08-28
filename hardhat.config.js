require("@nomicfoundation/hardhat-toolbox");
require("@chainlink/env-enc").config();

const privateKey = process.env.PRIVATE_KEY;
const privateKey2 = process.env.PRIVATE_KEY2;
const alchemyKey = process.env.ALCHEMY_KEY;
const etherscanKey = process.env.ETHERSCAN_API_KEY;

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.28",
  networks: {
    sepolia: {
      url: `https://eth-sepolia.g.alchemy.com/v2/${alchemyKey}`,
      accounts: [privateKey,privateKey2]
    }
  },
  etherscan: {
    apiKey: etherscanKey
  }
};
