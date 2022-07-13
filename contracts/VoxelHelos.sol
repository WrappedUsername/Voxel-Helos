// SPDX-License-Identifier: MIT
/*
   :::     :::  ::::::::  :::    ::: :::::::::: :::           :::    ::: :::::::::: :::        ::::::::   :::::::: 
  :+:     :+: :+:    :+: :+:    :+: :+:        :+:           :+:    :+: :+:        :+:       :+:    :+: :+:    :+: 
 +:+     +:+ +:+    +:+  +:+  +:+  +:+        +:+           +:+    +:+ +:+        +:+       +:+    +:+ +:+         
+#+     +:+ +#+    +:+   +#++:+   +#++:++#   +#+           +#++:++#++ +#++:++#   +#+       +#+    +:+ +#++:++#++   
+#+   +#+  +#+    +#+  +#+  +#+  +#+        +#+           +#+    +#+ +#+        +#+       +#+    +#+        +#+    
#+#+#+#   #+#    #+# #+#    #+# #+#        #+#           #+#    #+# #+#        #+#       #+#    #+# #+#    #+#     
 ###      ########  ###    ### ########## ##########    ###    ### ########## ########## ########   ######## 
*/
pragma solidity 0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
 
/// @author WrappedUsername
contract VoxelHelos is ERC721, Ownable {
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
    /// @dev Maximum supply is 4000. Update if needed.
    uint256 public maxSupply = 4000;

    /** @notice Constructor assigns name and symbol. Token id counter increments here to start 
    the token count at 1 to match metadata. */ 
    constructor() ERC721("Voxel Helos", "VH") {
        _tokenIdCounter.increment();
    }
/*
   :::     :::  ::::::::  :::    ::: :::::::::: :::           :::    ::: :::::::::: :::        ::::::::   :::::::: 
  :+:     :+: :+:    :+: :+:    :+: :+:        :+:           :+:    :+: :+:        :+:       :+:    :+: :+:    :+: 
 +:+     +:+ +:+    +:+  +:+  +:+  +:+        +:+           +:+    +:+ +:+        +:+       +:+    +:+ +:+         
+#+     +:+ +#+    +:+   +#++:+   +#++:++#   +#+           +#++:++#++ +#++:++#   +#+       +#+    +:+ +#++:++#++   
+#+   +#+  +#+    +#+  +#+  +#+  +#+        +#+           +#+    +#+ +#+        +#+       +#+    +#+        +#+    
#+#+#+#   #+#    #+# #+#    #+# #+#        #+#           #+#    #+# #+#        #+#       #+#    #+# #+#    #+#     
 ###      ########  ###    ### ########## ##########    ###    ### ########## ########## ########   ######## 
*/

    /// @dev Fixed json file extensions, removed .json from files, metadata found.
    function _baseURI() internal pure override returns (string memory) {
        return "/"; // new art here
    }

    /// @notice Free mint for owner.
    function ownerMint(address to) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        require(_tokenIdCounter.current() <= maxSupply, "ALl NFT's have been minted");
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }

    /// @notice Added price to mint for "the public".
    function safeMint(address to) public payable {
        require(msg.value >= price, "Please pay .05 ether");
        uint256 tokenId = _tokenIdCounter.current();
        require(_tokenIdCounter.current() <= maxSupply, "ALl NFT's have been minted");
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }

    /// @notice Added withdraw function.
    function withdraw() public payable onlyOwner {
        require(payable(msg.sender).send(address(this).balance));
    }
/*
   :::     :::  ::::::::  :::    ::: :::::::::: :::           :::    ::: :::::::::: :::        ::::::::   :::::::: 
  :+:     :+: :+:    :+: :+:    :+: :+:        :+:           :+:    :+: :+:        :+:       :+:    :+: :+:    :+: 
 +:+     +:+ +:+    +:+  +:+  +:+  +:+        +:+           +:+    +:+ +:+        +:+       +:+    +:+ +:+         
+#+     +:+ +#+    +:+   +#++:+   +#++:++#   +#+           +#++:++#++ +#++:++#   +#+       +#+    +:+ +#++:++#++   
+#+   +#+  +#+    +#+  +#+  +#+  +#+        +#+           +#+    +#+ +#+        +#+       +#+    +#+        +#+    
#+#+#+#   #+#    #+# #+#    #+# #+#        #+#           #+#    #+# #+#        #+#       #+#    #+# #+#    #+#     
 ###      ########  ###    ### ########## ##########    ###    ### ########## ########## ########   ######## 
*/
}
