// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    uint256 private constant _NOT_ENTERED = 1;
    uint256 private constant _ENTERED = 2;

    uint256 private _status;

    address public admin;

    modifier nonReentrant() {
        require(_status != _ENTERED, "ReentrancyGuard: reentrant call");
        _status = _ENTERED;
        _;

        _status = _NOT_ENTERED;
    }

    constructor() ERC20 ('MeshToken', 'MESH') {
        _mint(msg.sender, 1000000000 * 10 ** 18);
        admin = msg.sender;
    }

    /**
    * @dev Creates `amount` tokens and assigns them to `account`
    */
    function mint(address to, uint256 amount) external {
        require(msg.sender == admin, 'Only admin can perform task');
        _mint(to, amount);
    }

    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    /**
    * @dev transfer token to an account
    */
    function tokenTransfer(address to, uint256 amount) external nonReentrant {
        _transfer(admin, to, amount);
    }

    /**
    * @dev When a user wants to gift a token to another user
    */
    function giftToken(address to, uint256 amount) external nonReentrant {
        transfer(to, amount);
    }

    /**
    * @dev get the user's spend allowance
    */
    function getUserAllowance(address from, address to) external view returns(uint256) {
        return allowance(from, to);
    }
}