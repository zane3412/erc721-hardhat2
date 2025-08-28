// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ZaneNFT is ERC721URIStorage, Ownable {
    // Counter for the next token ID
    uint256 public nextTokenId = 1;

    // Mapping from user address to their avatar token ID
    mapping(address => uint256) public userAvatar;

    event AvatarMinted(
        address indexed user,
        uint256 indexed tokenId,
        string uri
    );
    event AvatarChanged(
        address indexed user,
        uint256 indexed tokenId,
        string uri
    );
    event AvatarBurned(address indexed user, uint256 indexed tokenId);

    constructor() ERC721("ZaneNFT", "ZNFT") Ownable(msg.sender) {}

    /**
     * mintAvatar: mint a new avatar NFT
     * rules: Allow multiple avatars, but only set one as the current avatar
     * @param to receiver address
     * @param uri metadata URI
     */
    function mintAvatar(address to, string memory uri) external onlyOwner {
        _safeMint(to, nextTokenId);
        _setTokenURI(nextTokenId, uri);

        userAvatar[to] = nextTokenId;

        // check if the avatar has been set,if not, set the current avatar.
        if (userAvatar[to] == 0) {
            userAvatar[to] = nextTokenId;
        }
        emit AvatarMinted(to, nextTokenId, uri);
        nextTokenId++;
    }

    /**
     * set active avatar
     * @param tokenId token ID
     */
    function setActiveAvatar(uint256 tokenId) external {
        require(ownerOf(tokenId) == msg.sender, "You do not own this avatar");
        userAvatar[msg.sender] = tokenId;
        emit AvatarChanged(msg.sender, tokenId, tokenURI(tokenId));
    }

    /**
     * burn avatar
     * @param tokenId token ID
     */
    function burnAvatar(uint256 tokenId) external {
        // clear userAvatar mapping
        uint256 _tokenId = userAvatar[msg.sender];
        if (_tokenId == tokenId) {
            userAvatar[msg.sender] = 0;
        }
        //burn avatar
        _burn(tokenId);
        emit AvatarBurned(msg.sender, tokenId);
    }

    

    /**
     * Etherscan 识别 ERC721 的关键：显式 override supportsInterface
     * @param interfaceId interface ID
     */
    function supportsInterface(
        bytes4 interfaceId
    ) public view virtual override returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}
