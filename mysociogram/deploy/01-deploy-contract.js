const hre = require('hardhat');
const {
  developmentChains
} = require("../helper-hardhat-config")
const { verify } = require("../helper-functions")

async function main() {
  // We get the contract to deploy
  console.log("Deploying contract...");
  const Contract = await hre.ethers.getContractFactory('FoundersGovernance');
  const contract = await Contract.deploy("0x99eb18F2c16d12eA40d30e064874bA33bD4296a1");
  
  await contract.deployed();
  console.log('Contract deployed to:', contract.address);
  
  await contract.deployTransaction.wait(1);

  if (
    !developmentChains.includes(network.name)
  ) {
    await verify(contract.address, ["0x99eb18F2c16d12eA40d30e064874bA33bD4296a1"])
  }
}


main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });