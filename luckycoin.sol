pragma solidity ^0.4.18;

contract luckycoin
{
	string public name = 'Lucky Coin PreSale';
	string public symbol = 'LCP';
	uint8 public decimals = 0;
	
	address public owner = 0x0;
	
	uint public totalSupply = 0;
	
	mapping (address => uint) public balanceOf;
	
	modifier onlyowner {require (msg.sender == owner); _;}
	
	event Transfer (address indexed sender, address indexed recipient, uint amount);
	
	function luckycoin () public {owner = msg.sender;}
	function kill () external onlyowner {selfdestruct (owner);}
	
	function () external payable
	{
	    require (msg.value >= 10000000000000000 && msg.sender != 0x0);
	    
	    owner.transfer (msg.value);
	    
	    balanceOf [msg.sender] += msg.value / 10000000000000000;
	    totalSupply += msg.value / 10000000000000000;
	    
	    Transfer (this, msg.sender, msg.value / 10000000000000000);
	}
}