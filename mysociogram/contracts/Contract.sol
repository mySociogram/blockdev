// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import './meshtoken/MyToken.sol';
import './registration/UserRegistration.sol';
import './Governance.sol';

contract Contract is MyToken, UserRegistration, Governance {}