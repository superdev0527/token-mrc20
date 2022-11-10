pragma solidity ^0.8.9;

//this is the compiler version//

contract BIGToken {
    //this is the token contract name, change to liking//

    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    event Burn(address indexed from, uint256 value);

    string public constant symbol = "BIG";
    //this is the token symbol, change to liking//
    string public constant name = "BigCoin";
    //this is the token name, change to liking//y
    uint8 public constant decimals = 0;
    //this is the number of decimal place for the token, change to liking//
    uint256 _totalSupply = 1000000;
    //this is the total supply of token to be created, change to liking//
    uint256 _totalBurned = 0;

    address public owner;

    mapping(address => uint256) balances;

    mapping(address => mapping(address => uint256)) allowed;

    modifier onlyOwner() {
        if (msg.sender != owner) {
            revert();
        }
        _;
    }

    constructor() //this is the token contract name, change to liking//

    {
        owner = msg.sender;
        balances[owner] = _totalSupply;
    }

    function totalSupply() external view returns (uint256 l_totalSupply) {
        l_totalSupply = _totalSupply;
    }

    function totalBurned() external view returns (uint256 l_totalBurned) {
        l_totalBurned = _totalBurned;
    }

    function balanceOf(address _owner) external view returns (uint256 balance) {
        return balances[_owner];
    }

    //  function transfer(address _to, uint256 _amount) returns (bool success) {
    //      if (_to == 0x0) revert();

    //      if (
    //          balances[msg.sender] >= _amount &&
    //          _amount > 0 &&
    //          balances[_to] + _amount > balances[_to]
    //      ) {
    //          balances[msg.sender] -= _amount;
    //          balances[_to] += _amount;
    //          Transfer(msg.sender, _to, _amount);
    //          return true;
    //      } else {
    //          return false;
    //      }
    //  }

    function transferFrom(
        address _from,
        address _to,
        uint256 _amount
    ) external returns (bool success) {
        if (_to == address(0x0)) revert();

        if (
            balances[_from] >= _amount &&
            _amount > 0 &&
            balances[_to] + _amount > balances[_to]
        ) {
            if (msg.sender != _from) {
                if (allowed[_from][msg.sender] < _amount) return false;
                allowed[_from][msg.sender] -= _amount;
            }
            balances[_from] -= _amount;
            balances[_to] += _amount;
            emit Transfer(_from, _to, _amount);
            return true;
        } else {
            return false;
        }
    }

    function approve(address _spender, uint256 _amount)
        external
        returns (bool success)
    {
        allowed[msg.sender][_spender] = _amount;
        emit Approval(msg.sender, _spender, _amount);
        return true;
    }

    function allowance(address _owner, address _spender)
        external
        view
        returns (uint256 remaining)
    {
        return allowed[_owner][_spender];
    }

    function burn(uint256 _value) external returns (bool success) {
        if (balances[msg.sender] < _value) revert();
        balances[msg.sender] -= _value;
        _totalSupply -= _value;
        _totalBurned += _value;
        emit Burn(msg.sender, _value);
        return true;
    }

    function burnFrom(address _from, uint256 _value)
        external
        returns (bool success)
    {
        if (balances[_from] < _value) revert();
        if (_value > allowed[_from][msg.sender]) revert();
        balances[_from] -= _value;
        _totalSupply -= _value;
        _totalBurned += _value;
        emit Burn(_from, _value);
        return true;
    }
}
