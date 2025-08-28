# ZaneNFT 🎨

基于 **Solidity + Hardhat** 开发的 NFT 智能合约示例。\
该项目演示了如何在以太坊测试网 (Sepolia) 部署和验证一个 **ERC721 NFT
合约**，并通过脚本完成铸造与查询。

## ✨ 功能特性

-   实现 ERC721 标准，支持元数据存储 (`ERC721URIStorage`)\
-   仅合约拥有者可调用 `mint` 进行铸造\
-   支持 `IPFS`/`Pinata` 链接作为 Token URI\
-   自动化部署与 Etherscan 验证\
-   提供示例脚本用于快速测试 NFT 功能

## 📂 项目结构

    ├── contracts/
    │   └── ZaneNFT.sol          # 主合约
    ├── scripts/
    │   ├── deploy.js            # 部署脚本
    │   └── testMint.js          # 测试脚本
    ├── hardhat.config.js        # Hardhat 配置文件
    ├── package.json
    └── README.md

## 🚀 快速开始

### 1️⃣ 克隆项目

``` bash
git clone https://github.com/yourusername/ZaneNFT.git
cd ZaneNFT
```

### 2️⃣ 安装依赖

``` bash
npm install
```

### 3️⃣ 配置环境变量

本项目使用
[`@chainlink/env-enc`](https://www.npmjs.com/package/@chainlink/env-enc)
管理密钥。

设置加密密码
``` bash
npx env-enc set-pw
```
设置环境变量
``` bash
npx env-enc set
```

``` bash
PRIVATE_KEY=你的钱包私钥
PRIVATE_KEY2=另一个测试钱包私钥
ALCHEMY_KEY=你的Alchemy API Key
ETHERSCAN_API_KEY=你的Etherscan API Key
```

运行时会自动解密使用，无需明文暴露密钥。

### 4️⃣ 编译合约

``` bash
npx hardhat compile
```

### 5️⃣ 部署合约到 Sepolia

``` bash
npx hardhat run scripts/deploy.js --network sepolia
```

### 6️⃣ 执行测试脚本

``` bash
npx hardhat run scripts/testMint.js --network sepolia
```

## 🔗 技术栈

-   [Solidity \^0.8.20](https://soliditylang.org/)\
-   [Hardhat](https://hardhat.org/)\
-   [OpenZeppelin
    Contracts](https://github.com/OpenZeppelin/openzeppelin-contracts)\
-   [Alchemy](https://www.alchemy.com/)\
-   [Etherscan](https://etherscan.io/)\
-   [@chainlink/env-enc](https://www.npmjs.com/package/@chainlink/env-enc)

## 📜 合约功能示例

``` solidity
function mint(address to, string memory uri) external onlyOwner {
    _safeMint(to, nextTokenId);
    _setTokenURI(nextTokenId, uri);
    nextTokenId++;
}
```

示例调用：

``` js
await nft.mint(user1.address, "ipfs://QmABC123/metadata.json");
```

## 🎯 项目目标

通过该项目你将学习：

-   如何编写并部署一个 ERC721 NFT 合约\
-   如何上传元数据到 IPFS/Pinata\
-   如何在 Hardhat 中进行部署、验证和测试\
-   如何使用 `@chainlink/env-enc` 管理敏感信息

------------------------------------------------------------------------

🙌 欢迎 Fork & Star 本项目！
