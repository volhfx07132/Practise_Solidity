pragma solidity >=0.7.0 <0.9.0;
import "./Strings.sol";

contract Concat{
    using Strings for string;

    function testConcat(string memory _oldvalue) public view returns(string memory){
        return _oldvalue.concat("Concat me!");
    }

    function findData(string memory _oldvalue) public view returns(uint[] memory){
        return _oldvalue.findCharacter("t");
    }
}