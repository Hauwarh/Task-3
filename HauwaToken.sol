// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.5.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.5.0/access/Ownable.sol";

contract HauwaToken is ERC20, Ownable {
     uint256 public rate= 1000 * 10 ** decimals();
     uint256 FixedSupply;
    constructor() ERC20("HauwaToken", "HTK") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
         FixedSupply= 1000000 * 10 ** 18;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function buyTokens(address reciever) public payable {
         require (msg.value >= 1 * 10**18, "send ETH to get token");
         uint256 tokenbought= msg.value * rate;
         FixedSupply = FixedSupply + tokenbought;
    }


     
}
