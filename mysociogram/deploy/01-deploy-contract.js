const hre = require('hardhat');
const {
  developmentChains
} = require("../helper-hardhat-config")
const { verify } = require("../helper-functions")

async function main() {
  // We get the contract to deploy
  const Contract = await hre.ethers.getContractFactory('Contract');
  const contract = await Contract.deploy();
  
  await contract.deployed();
  console.log('Contract deployed to:', contract.address);
  
  await contract.deployTransaction.wait(1);

  if (
    !developmentChains.includes(network.name)
  ) {
    await verify(contract.address, [])
  }
}


main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });