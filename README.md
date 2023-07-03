# SocialMesh contracts
Contains all SocialMesh Smart Contracts on Fantom Blockchain

contracts require hardhat and solidity version 0.8.1 at minimum.

## Mainnet contract addresses:
**User registration address**
- 0xE48567f257a01a6F635771eD6380cae8A95D98c1

**Community token contract addresses**
- FTN: 0x99eb18F2c16d12eA40d30e064874bA33bD4296a1
- DETN: 0x010c4a29Bd697E8E45Bd61FF805BFDEBAa5E9a24
- DSTN: 0x066DDEc37Ef54f2Cc8Fc2CA1b802Af9F503BF113

please install `npm` or its equivalent instructions.

## Install dependencies:

```bash
npm run install
```


## Building the project


```bash
npm run build
# or
yarn build
```


Deploying Contracts
```bash
npm run deploy
# or
yarn hardhat run 
```
The following functions; propose(), executeProposal(), and cancelProposal() including TimelockControl() will be handled using Openzeppelin defender.
