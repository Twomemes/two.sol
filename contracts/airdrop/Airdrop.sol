// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/utils/cryptography/draft-EIP712Upgradeable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "../interfaces/IAirdrop.sol";

contract Airdrop is IAirdrop, OwnableUpgradeable, EIP712Upgradeable {
    address public _signer;
    IERC20 _two;
    mapping(address => uint256) public _claimList;

    function initialize() public initializer {
        __EIP712_init("two", "0");
        __Ownable_init();
    }

    function claim(
        uint256 amount,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) public override {
        require(_claimList[msg.sender] == 0, "HAD CLAIMED");
        bytes32 signature = keccak256(abi.encode(msg.sender,amount));
        address signer = ecrecover(signature, v, r, s);

        require(signer == _signer, "INVALID SIGNATURE");
        _two.transfer(msg.sender, amount);
        _claimList[msg.sender] = amount;
        emit Claim(msg.sender, amount);
    }

    function getClaimedAmount() public override view returns(uint256) {
        return _claimList[msg.sender];
    }

    function setSigner(address signer) public onlyOwner {
        _signer = signer;
    }

    function version() public pure returns (uint256) {
        return 0;
    }
}