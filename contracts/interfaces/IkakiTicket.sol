pragma solidity ^0.8.0;
import "./IBaseERC721.sol";
interface IkakiTicket is IBaseERC721{
    function mint(
        address to
    ) external;
}
