// SPDX-License-Identifier: MIT
/** 
@custom:dev Please use locked pragma for production to avoid SWC-103
floating pragma i.e. ^0.8.0, using a locked pragma that
has been thoroughly tested with the contract ensures
that contracts do not accidentally get deployed using, for example, 
an outdated compiler version that might introduce bugs that affect 
the contract system negatively. 
Pragma version 0.8.14 necessitates a version too recent to be trusted. 
Consider deploying with 0.6.12/0.7.6/0.8.7, solc-0.8.14 is not recommended for deployment
Reference: https://github.com/crytic/slither/wiki/Detector-Documentation#incorrect-versions-of-solidity
*/
// Locked pragma and not too recent of version.
pragma solidity 0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

/// @title Genesis project for Voxel Helos 
/// @author WrappedUsername
/// @custom:security-contact voxelhelos@gmail.com
contract VoxelHelosGenesis is ERC721, Ownable {
    /** 
    @notice Using for directive, provides counters that can only be incremented, decremented or reset. 
    This can be used e.g. to track the number of elements in a mapping, issuing ERC721 ids, 
    or counting request ids. 
    */
    using Counters for Counters.Counter;
    /** 
    @notice Public state variable of integer value type, assigned in safeMint function
    as tokenId. 
    */
    Counters.Counter public _tokenIdCounter;
    /// @notice Price for "the public" (not owner) safeMint function.
    uint256 public price = .05 ether; 
    /// @notice Maximum supply is 4000, tokenId 0 does not have corresponding json file.
    uint256 public maxSupply = 4001;

    /// @notice Constructor assigns name and symbol.
    constructor() ERC721("Voxel Helos Genesis", "VHG") {}

    /// @dev Fixed json file extensions, removed .json from files, metadata found!
    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://QmXNbjXEFWCPap3vjtm11Di6JcK2Fyy5fswsCtgWV6hxho/";
    }

    /// @dev Free mint for owner.
    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }

    /// @dev Added price to mint for "the public". Fixed shadowed declaration.
    function safeMint(address to, uint256 _price) public payable {
        price = _price;
        require(msg.value == price, "Please pay .05 ether");
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }
}