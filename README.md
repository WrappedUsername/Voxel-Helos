# Voxel Helos
Smart contract for Voxel Helos NFT project on ethereum.
## Token id will start at 1.
```Solidity

/// @ notice Token id counter increments here to start the token count at 1 to match metadata. 
    constructor() ERC721("Voxel Helos", "VH") {
        _tokenIdCounter.increment();
    }

```
