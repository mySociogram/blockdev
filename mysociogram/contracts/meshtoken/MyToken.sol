// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    address public admin;

    constructor() ERC20 ('MeshToken', 'MESH') {
        _mint(msg.sender, 1000000000 * 10 ** 18);
        admin = msg.sender;
    }

    function mint(address to, uint256 amount) external {
        require(msg.sender == admin, 'Only admin can perform task');
        _mint(to, amount);
    }

    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    function userTransfer(address from, address to, uint256 amount) external {
        // increase the spend allowance
        increaseAllowance(to, amount);
        // then transfer the token
        transferFrom(from, to, amount);
    }

    // When a user wants to gift a token to another user
    function giftToken(address to, uint256 amount) external {
        transfer(to, amount);
    }

    function getUserAllowance(address from, address to) external view returns(uint256) {
        // get the user's spend allowance
        return allowance(from, to);
    }
}