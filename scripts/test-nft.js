const { ethers } = require("hardhat");

async function main() {
    const [deployer, user1] = await ethers.getSigners();

    const nft = await ethers.getContractAt("ZaneNFT", "0xd9ACb9915B65d02969894a5117F8B1134Ec48c23")

    const tx = await nft.mint(user1.address,"https://indigo-electric-heron-26.mypinata.cloud/ipfs/bafkreih35vqqaympualbkry6bp4be5qkvxx7zvqysfx2soeo3s2cxorgoy");

    await tx.wait();

    console.log("Mint 成功，Token ID = 0 给:", user1.address);

    // 查询 user1 的 NFT 数量
    const balance = await nft.balanceOf(user1.address);
    console.log("user1 NFT 数量:", balance.toString());

    // 查询 Token ID 0 的拥有者
    const owner = await nft.ownerOf(0);
    console.log("Token ID 0 拥有者:", owner);

}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});