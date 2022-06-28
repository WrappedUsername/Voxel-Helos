// old javascript
// const { expect } = require("chai");
// const { ethers, upgrades } = require("hardhat");

//new javascript
import { ethers } from "hardhat";
import { expect } from "chai";

// new javascript
describe("Voxel Helos Genesis Smart Contract Tests", () =>  {

  beforeEach(() => {
  const VoxelHelosGenesis = await ethers.getContractFactory("Voxel helos Genesis");
  const voxelHelosGenesis = await delpoy(VoxelHelosGenesis);
  await voxelHelosGenesis.deployed();
  console.log("Voxel Helos Genesis deployed to:", voxelHelosGenesis.address);
  }),
  // WIP
  it("VHG NFT minted successfully", () =>  {
    const account1 = await ethers.getSigners();
    expect(await voxelHelosGenesis.balanceOf(account1.address)).to.equal(0);
    expect(await voxelHelosGenesis.safeMint());
    const count = await voxelHelosGenesis._tokenIdCounter();
    console.log("Minted:", count)
    
  }),
  // WIP
  afterEach(() => {
    const account1 = await ethers.getSigners();
    const count = await voxelHelosGenesis._tokenIdCounter();
    expect(await voxelHelosGenesis.ownerOf(count));
    console.log("owner:", count, account1.address);
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
