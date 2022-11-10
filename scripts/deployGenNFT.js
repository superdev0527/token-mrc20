// We require the Hardhat Runtime Environment explicitly here. This is optional 
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
const hre = require("hardhat");

async function main() {
  // Hardhat always runs the compile task when running scripts with its command
  // line interface.
  //
  // If this script is run directly using `node` you may want to call compile 
  // manually to make sure everything is compiled
  // await hre.run('compile');

  // We get the contract to deploy
  // const PINKLOACK = await hre.ethers.getContractFactory("PoolFactory");
  // const PinkLock = await PINKLOACK.deploy();

  // await PinkLock.deployed();

  // console.log("Contract deployed to:", PinkLock.address);

  // const POOLFACTORY = await hre.ethers.getContractFactory("BunnyFarm");
  // const PoolFactory = await POOLFACTORY.deploy("0x246927c60C34a3B7775437ac1C7c96c7323515c6", "1000000000000000000000");

  // await PoolFactory.deployed();

  // console.log("Contract deployed to:", PoolFactory.address);

  const POOLFACTORY = await hre.ethers.getContractFactory("DACHLock");
  const PoolFactory = await POOLFACTORY.deploy();

  await PoolFactory.deployed();

  console.log("Contract deployed to:", PoolFactory.address);

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
