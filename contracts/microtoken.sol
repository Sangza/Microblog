// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.7;

 contract MicroToken{

    string  public name;
    string  public symbol;
    uint8 public  decimals;
    uint256 public  totalSupply;
    address public owner;

      mapping (address => uint) public balances;
     mapping (address => mapping(address => uint )) public allowed;


     event Transfer(address indexed _from, address indexed _to, uint256 _value);
     event Approval(address indexed _owner, address indexed _spender, uint256 _value);


  constructor(string memory _name, string memory  _symbol,uint8  _decimals,uint256  _initalSupply){
    owner = msg.sender;
    name =_name;
    symbol = _symbol;
    decimals = _decimals;
    totalSupply = _initalSupply;
    balances[msg.sender] = _initalSupply;

  }


  function tokenname() public  view returns (string memory){
    return name;
  }

  function tokensymbol() public view returns ( string memory){
    return symbol;
  }

  function tokendecimal() public view returns(uint8){
    return decimals;
  }

  function tokentotalSupply() public view returns(uint256){
    return totalSupply;
  }

  function balanceOf(address _owner) view public returns (uint256) {
     return balances[_owner];
  }

  function transfer(address _to, uint256 _value) public payable returns(bool success){
    assert(msg.sender == owner);
    require(balances[msg.sender] >= _value, 'insufficent balance');
    balances[owner] -= _value;
    balances[_to] += _value;
   emit Transfer(msg.sender, _to, _value);
   return true;
  }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
        uint _allowance = allowed[_from][msg.sender];
        require(_allowance >= _value,'not enough');
        require(balances[_from] >= _value,'not enough');
        balances[_from] -= _value;
        balances[_to] += _value;
        emit Transfer(_from, _to, _value);
        return true;
    }

   function approve(address _spender, uint256 _value) public returns (bool success){
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
     return true;
   }

   function allowance(address _owner, address _spender) public view returns (uint256 remaining){
      return allowed[_owner][_spender];
   }

}