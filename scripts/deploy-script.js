const { ethers } = require("hardhat");

async function main() {
  const VoxelHelosGenesis = await ethers.getContractFactory("Voxel Helos Genesis");
  const voxelHelosGenesis = await voxelHelosGenesis.deploy(VoxelHelosGenesis);
  await voxelHelosGenesis.deployed();
  console.log("Voxel Helos Genesis deployed to:", voxelHelosGenesis.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
