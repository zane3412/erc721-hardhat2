
const { ethers } = require("hardhat")


async function main() {
    const [deployer] = await ethers.getSigners();
    console.log("部署账户地址", deployer.address);

    const ZaneNFT = await ethers.getContractFactory("ZaneNFT");
    const nft = await ZaneNFT.deploy();

    await nft.waitForDeployment();  // 确保部署完成

    const address = await nft.getAddress();
    console.log("合约部署地址:", address);

    // ✅ 等待 5 个区块确认
    console.log("等待 5 个区块确认后再进行验证...");
    await nft.deploymentTransaction().wait(5);

    // ✅ 自动验证合约
    await hre.run("verify:verify", {
        address: address,
        constructorArguments: [],
    });

}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
})