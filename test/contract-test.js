// old javascript
// const { expect } = require("chai");
// const { ethers, upgrades } = require("hardhat");

//new javascript
import { ethers } from "hardhat";
import { expect } from "chai";

// new javascript
describe = () => ("Voxel Helos Genesis Smart Contract Tests",  {

  this:beforeEach = async () => {
  const VoxelHelosGenesis = await ethers.getContractFactory("Voxel helos Genesis");
  const voxelHelosGenesis = await delpoy(VoxelHelosGenesis);
  await voxelHelosGenesis.deployed();
  console.log("Voxel Helos Genesis deployed to:", voxelHelosGenesis.address);
  },
  // WIP
  it: async () => ("VHG NFT minted successfully", {
    [account1]: await ethers.getSigners(),
    expect: async () => {
      await voxelHelosGenesis.balanceOf(account1.address).to.equal(0)
    },
    const: voxelHelosGenesis = await VoxelHelosGenesis.safeMint(),
    console:log("Minted:", _tokenIdCounter)
    
  })
  
})

// old javascript
//describe("Voxel Helos Genesis Smart Contract Tests", function () {

  //let voxelHelosGenesis;

  //this.beforeEach(async function() {
    //const VoxelHelosGenesis = await ethers.getContractFactory("Voxel Helos Genesis");
    //const instance = await deploy(voxelHelosGenesis);
    //await voxelHelosGenesis.deployed();
    //console.log("Voxel Helos Genesis deployed to:", voxelHelosGenesis.address);
  //})

  //it("VHG NFT minted successfully", async function () {
    //[account1] = await ethers.getSigners();
    //expect(await voxelHelosGenesis.balanceOf(account1.address)).to.equal(0);

  //});
//})
