// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
// import "@openzeppelin/contracts/token/erc20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";

interface IDebtToken is IERC20Metadata {
    function burn(address account, uint256 amount) external;

    function mint(address account, uint256 amount) external;
}
