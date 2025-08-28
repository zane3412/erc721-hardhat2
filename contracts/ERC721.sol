// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ZaneNFT is ERC721URIStorage, Ownable {
    uint256 public nextTokenId;

    constructor() ERC721("ZaneNFT", "ZNFT") Ownable(msg.sender) {}

    function mint(address to,string memory uri) external onlyOwner {
        _safeMint(to, nextTokenId);
        _setTokenURI(nextTokenId,uri);
        nextTokenId++;
    }
}

