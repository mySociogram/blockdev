# SocialMesh contracts
Contains all SocialMesh Smart Contracts on Fantom Blockchain

contracts require `hardhat` and `solidity` version 0.8.1 at minimum.

please install `npm` or its equivalent instructions.

## Install dependencies:

```bash
npm run install
# or 
yarn install
```


## Building the project

```bash
npm run build
# or
yarn build
```

## Deploying Contracts
```bash
npm run deploy
# or
yarn hardhat run 
```
## Contracts 

**MyToken:**
The contract imports the ERC20 library from OpenZeppelin and extends it to create a new token called SocialFoundersToken. The contract has several functions including mint(), burn(), tokenTransfer(), giftToken() and getUserAllowance(). These functions are used to manage the token.
The constructor function sets up the token with a name of “FoundersToken” and a symbol of “FTN”. It also mints 1 billion tokens and assigns them to the contract creator.
The contract has an admin address and an array of minters. Only addresses authorized by the admin can perform certain tasks such as minting new tokens.

**GOVERNANCE:**
This code is a smart contract written in Solidity and released under the license 'MIT'. It is a governance contract that uses OpenZeppelin's Governor library to manage voting on proposals. The contract is compatible with Solidity ^0.8.9.
The contract imports several extensions from the Governor library including GovernorSettings, GovernorCountingSimple, GovernorVotes and GovernorVotesQuorumFraction. These extensions are used to set up the voting parameters such as voting delay, voting period and quorum.
The constructor function sets up the governance contract with the name "Governance" and initializes the voting parameters using the imported extensions from Openzeppelin.
The contract overrides several functions required by Solidity including votingDelay(), votingPeriod(), quorum() and proposalThreshold(). These functions are used to customize the governance contract.
*The following Governance functions; propose(), executeProposal(), and cancelProposal() including TimelockControl() will be handled using Openzeppelin defender.*

## Deployed Fantom Mainnet contract addresses:

**User registration address**
- [0xE48567f257a01a6F635771eD6380cae8A95D98c1] (https://ftmscan.com/address/0xE48567f257a01a6F635771eD6380cae8A95D98c1)

**Community token contract addresses**
- FoundersToken(FTN): [0x99eb18F2c16d12eA40d30e064874bA33bD4296a1] (https://ftmscan.com/address/0x99eb18F2c16d12eA40d30e064874bA33bD4296a1)

- DevToken(DETN): [0x010c4a29Bd697E8E45Bd61FF805BFDEBAa5E9a24] (https://ftmscan.com/address/0x010c4a29Bd697E8E45Bd61FF805BFDEBAa5E9a24)

- DesgToken(DSTN): [0x066DDEc37Ef54f2Cc8Fc2CA1b802Af9F503BF113] (https://ftmscan.com/address/0x066DDEc37Ef54f2Cc8Fc2CA1b802Af9F503BF113)

**Governance**
- DevGovernance: [0xa4c6305789E9868a8ee1366DfdAa203f4d4b976d] (https://ftmscan.com/address/0xa4c6305789E9868a8ee1366DfdAa203f4d4b976d)

- DesgGovernance: [0x45e87148f62326AB90Ef89e3CdaB94fc32174095] (https://ftmscan.com/address/0x45e87148f62326AB90Ef89e3CdaB94fc32174095)

- FoundersGovernance: [0xdA17543a6e98c0A339A9bd2c363D2370cdb555be] (https://ftmscan.com/address/0xdA17543a6e98c0A339A9bd2c363D2370cdb555be)



