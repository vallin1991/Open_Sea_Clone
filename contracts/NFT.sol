//SPDX-License-Identifier: MIT  
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFT is ERC721URIStorage{
    //auto-increment field for each token
  
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    //address of the NFT market place
    address contractAddress;

    constructor(address marketplaceAddress) ERC721("Partenerverse Tokens", "PNVT"){
        contractAddress = marketplaceAddress;

    }

    ///@notice create a new toke
    ///@param tokenURI : token URI

    function createToken(string memory tokenURI) public returns(uint){
        //set a new token id for the token to be minted

        _tokenIds.increment();//0,1,2,3,4
        uint256 newItemId = _tokenIds.current();

        _mint(msg.sender, newItemId);//mint the token
        _setTokenURI(newItemId, tokenURI);//Generate the URI
        setApprovalForAll(contractAddress, true);//grant transaction permission to mark

        //return toke ID
        return newItemId;
    }

}

