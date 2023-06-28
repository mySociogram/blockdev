// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/governance/Governor.sol";
import "@openzeppelin/contracts/governance/extensions/GovernorCountingSimple.sol";
import "@openzeppelin/contracts/governance/extensions/GovernorVotes.sol";
import "@openzeppelin/contracts/governance/extensions/GovernorTimelockControl.sol";

contract Governance is Governor, GovernorCountingSimple, GovernorVotes, GovernorTimelockControl {

    constructor(ERC20Votes _token, TimelockController _timelock)
        Governor("Governance")
        GovernorVotes(_token)
        GovernorTimelockControl(_timelock)
    {}

    function votingDelay() public pure override(Governor, GovernorTimelockControl) returns (uint256) {
        return 40; // voting will be executed after 40 seconds   
        }

    function votingPeriod() public pure override(Governor, GovernorTimelockControl) returns (uint256) {
        return 259200; // voting ends after 72 hours 
    }

    function quorum(uint256) public pure override returns (uint256) {
        return 0.1; // requires ten percent of total votes to pass proposal  
    }

    function getVotes(address account, uint256 blockNumber)
        public view  override(IGovernor, GovernorVotes)
        returns (uint256)
    {
        return super.getVotes(account, blockNumber);
    }

    function state(uint256 proposalId)
        public        view        override(Governor, IGovernor)
        returns (ProposalState)
    {
        return super.state(proposalId);
    }

    function propose(
        address[] memory targets,
        uint256[] memory values,
        bytes[] memory calldatas,
        string memory description    )
        public        override(IGovernor, Governor, GovernorTimelockControl)
        returns (uint256)
    {
        return super.propose(targets, values, calldatas, description);
    }

    function _execute(
        uint256 proposalId,
        address[] memory targets,
        uint256[] memory values,
        bytes[] memory calldatas,
        bytes32 descriptionHash    )
        internal        override(Governor, GovernorTimelockControl)
    {
        super._execute(proposalId, targets, values, calldatas, descriptionHash);
    }

    function _cancel(
        address[] memory targets,
        uint256[] memory values,
        bytes[] memory calldatas,
        bytes32 descriptionHash    )
        internal        override(Governor, GovernorTimelockControl)
        returns (uint256)
    {
        return super._cancel(targets, values, calldatas, descriptionHash);
    }

    function supportsInterface(bytes4 interfaceId)
        public        view        override(Governor, GovernorTimelockControl, IERC165)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}