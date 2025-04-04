// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";    
import "@openzeppelin/contracts/access/Ownable.sol";

// make this contract inherits from: ERC721URIStorage contract
contract Assignment8 is ERC721URIStorage {
    // declare a private uint called _tokenIdCounter
    uint private _tokenIdCounter;
    address private owner;

    // pass name and symbol of the nft token collection
    constructor() ERC721("NewToken", "NTKN") {
	owner = msg.sender;
    }

    modifier isOwner {
      require(owner == msg.sender);
      _;
    }

    // make this function visibility: external
    // pass string json uri parameter
    // restrict this function to be called only by the owner
        // Hint: You can use OpenZeppelin Ownable contract imported above
    
    function mintNFT(string memory jsonURI) external isOwner {
        // call _mint to mint a new nft to the function caller
	_mint(msg.sender, _tokenIdCounter);
        // set token uri to the token id using _setTokenURI
	_setTokenURI(_tokenIdCounter, jsonURI);
        // increment token id counter
	_tokenIdCounter++;

    }

}
