// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ECertificateContract is ERC721Enumerable, Ownable {
    uint256 public nextTokenId;
    mapping(uint256 => string) private certificateDetails;

    constructor(string memory name, string memory symbol) ERC721(name, symbol) {}

    modifier onlyOwnerOrTokenOwner(uint256 tokenId) {
        require(
            msg.sender == owner() || _isApprovedOrOwner(msg.sender, tokenId),
            "Caller is not the owner or approved"
        );
        _;
    }

    function mint(address to, string memory certificateInfo) external onlyOwner {
        uint256 tokenId = nextTokenId;
        nextTokenId++;
        _safeMint(to, tokenId);
        certificateDetails[tokenId] = certificateInfo;
    }

    function getCertificateDetails(uint256 tokenId) external view onlyOwnerOrTokenOwner(tokenId) returns (string memory) {
        return certificateDetails[tokenId];
    }

    function approveAccess(uint256 tokenId, address approvedAddress) external onlyOwner {
        approve(approvedAddress, tokenId);
    }

    function destroy() external onlyOwner {
        address ownerAddress = owner();
        selfdestruct(payable(ownerAddress));
    }
}
