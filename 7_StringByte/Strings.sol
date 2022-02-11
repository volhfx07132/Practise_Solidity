pragma solidity >=0.7.0 <0.9.0;

library Strings{
    function concat(string memory _base, string memory _value) public view returns(string memory){
        bytes memory _baseBytes = bytes(_base);
        bytes memory _valueBytes = bytes(_value);
        string memory _tmpValue = new string(_baseBytes.length + _valueBytes.length);
        bytes memory _newValue = bytes(_tmpValue);
        uint i;
        uint j;
        for( i = 0 ; i <_baseBytes.length ; i++){
            _newValue[j++] = _baseBytes[i];
        }

        for( j = 0 ; j <_valueBytes.length ; j++){
            _newValue[i++] = _valueBytes[j];
        }
        return string(_newValue);
    }

    function findCharacter(string memory _base, string memory _value) public view returns(uint[] memory){
        uint[] memory myArray;
        uint index = 0;
        bytes memory _baseBytes = bytes(_base);
        bytes memory _valueBytes = bytes(_value);
        require(_baseBytes.length > 1 && _valueBytes.length == 1);

        for(uint i = 0 ; i < _baseBytes.length ; i++){
            if(_baseBytes[i] == _valueBytes[0]){
                myArray[index] = i;
                index++;
            }
        }
        return myArray;
    }
}