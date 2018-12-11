pragma solidity ^0.4.17;

import "openzeppelin-solidity/contracts/token/ERC20/ERC20Mintable.sol";
import "openzeppelin-solidity/contracts/token/ERC20/SafeERC20.sol";

contract IOUToken is ERC20Mintable {
    
    using SafeERC20 for ERC20;
    
    string public symbol;
    string public name;
    
    // ------------------------------------------------------------------------
    // Constructor
    // ------------------------------------------------------------------------
    constructor() public {
        symbol = "IOU";
        name = "IOUToken";
    }

    // ------------------------------------------------------------------------
    // Don't accept ETH
    // ------------------------------------------------------------------------
    function () public payable {
        revert();
    }
}
