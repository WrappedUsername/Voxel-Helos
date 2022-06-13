const { expect } = require("chai");
const { ethers } = require("hardhat");

// WIP
describe("Voxel Helos Genesis Smart Contract Tests", function () {

  let voxelHelosGenesis;
  // WIP
  // Deploying the smart contract before each test
  this.beforeEach(async function() {
    
    const VoxelHelosGenesis = await ethers.getContractFactory("Voxel Helos Genesis");
    
    const instance = await voxelHelosGenesis.deploy(voxelHelosGenesis);

    await voxelHelosGenesis.deployed();

    console.log("Voxel Helos Genesis deployed to:", voxelHelosGenesis.address);
  })
})
  //WIP
  it("VHG NFT minted successfully", async function () {
    [account1] = await ethers.getSigners();

    expect(await voxelHelosGenesis.balanceOf(account1.address)).to.equal(0);

  });
