pragma solidity >=0.7.0 <0.9.0;

library Library {
    function increment(uint _seft) public view returns(uint){
        return _seft+1;
    }
    function decrement(uint _seft) public view returns(uint){
        return _seft-1;
    }
    function incrementByValue(uint _seft, uint _amount) public view returns(uint){
        return _seft+_amount;
    }
    function decrementByValue(uint _seft, uint _amount) public view returns(uint){
        if(_seft > _amount){
           return _seft-_amount;
        }else{
            revert("Wrong value");
        }
        
    }
}