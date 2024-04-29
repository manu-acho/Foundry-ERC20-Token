// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract ManualToken {

    mapping(address => uint256) private s_balances; // This will map the address of holders to their balances

    // Alternatively, you can use the `public` visibility for the state variable
    // string public name = "Manual Token";
    function name() public pure returns (string memory) {
        return "Manual Token";
    }

    function decimals() public pure returns (uint8) {
        return 18;
    }


    function totalSupply() public pure returns (uint256) {
        return 100 ether;
    }

    function balanceOf(address _owner) public view returns (uint256) {
        return s_balances[_owner];
    }


    function transfer(address _to, uint256 _amount) public {
        uint256 previousBalances = balanceOf(msg.sender) + balanceOf(_to); // check previous balances
        s_balances[msg.sender] -= _amount; // update sender balance
        s_balances[_to] += _amount; // update receiver balance
        require(balanceOf(msg.sender) + balanceOf(_to) == previousBalances, "ManualToken: balances should be equal"); // check if balances are equal

    }


    function getBalance() public view returns (uint256) {
        return s_balances[msg.sender];
    }
}
   