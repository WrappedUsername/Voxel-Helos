// old javascript
//const { ethers } = require("hardhat");

// new javascript
import { ethers } from "hardhat";

// new javascript
const main = async () => {
  const VoxelHelosGenesis = await ethers.getContractFactory("Voxel helos Genesis");
  const voxelHelosGenesis = await delpoy(VoxelHelosGenesis);
  await voxelHelosGenesis.deployed();
  console.log("Voxel Helos Genesis deployed to:", voxelHelosGenesis.address);
};

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

// old javascript
//async function main() {
  //const VoxelHelosGenesis = await ethers.getContractFactory("Voxel Helos Genesis");
  //const voxelHelosGenesis = await deploy(VoxelHelosGenesis);
  //await voxelHelosGenesis.deployed();
  //console.log("Voxel Helos Genesis deployed to:", voxelHelosGenesis.address);
//}

//main()
  //.then(() => process.exit(0))
  //.catch((error) => {
    //console.error(error);
    //process.exit(1);
  //});
