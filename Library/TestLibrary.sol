pragma solidity >=0.7.0 <0.9.0;
import "./Library.sol";

contract TestLibrary{
    using Library for uint;

    function increment(uint _amount) public view returns(uint) {
        return _amount.increment();
    }
    function decrement(uint _amount) public view returns(uint) {
        return _amount.decrement();
    }
    function incrementByValue(uint _amount, uint _value) public view returns(uint) {
        return _amount.incrementByValue(_value);
    }
    function decrementByValue(uint _amount, uint _value) public view returns(uint) {
        return _amount.decrementByValue(_value);
    }
}