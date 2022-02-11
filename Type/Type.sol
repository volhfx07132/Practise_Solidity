pragma solidity >=0.7.0 <0.9.0;

contract TypeData{
//    bool myBool = false;
//    int8 myInt = -128;
//    uint myUint = 255; 
//    string myString;
//    uint8[] myStringArray;
//    bytes1 myValue2;
//    bytes32 myBytes1;
   
//    function myFunctiton(string[] memory _array) public {

//    }

//    enum Action {INIT, START, END}
   
//    Action public staticAction = Action.INIT;

//    function ActiveAction() public {
//        if(staticAction == Action.INIT){
//            staticAction = Action.START;
//        }else{
//           if(staticAction == Action.START){
//              staticAction = Action.END;
//           }else{
//                staticAction = Action.INIT;
//           }
//        }
//    }

//    address payable public myAddress;

//    function setAddress () public {
//       myAddress = payable(msg.sender);
//       myAddress.balance;
//       myAddress.transfer(10);
//    }

//    uint[] private myInitArray = [1,2,3,4];

//    function pushData(uint _value) public {
//        myInitArray.push(_value);
//    }
    
//    function deleteArrayData(uint _value) public {
//        delete myInitArray[_value];
//    }

//    function getArrayData() public view returns(uint[] memory){
//        return myInitArray;
//    }
    address public admin;

    mapping(address => uint) public balances;

    constructor(uint _balance) public{
        admin = msg.sender;
        balances[admin] = _balance;
    }
    
    modifier OnlyAdmin(){
        require(admin == msg.sender, "Only sender");
        _;
    }

    function tranfer(address _to, uint _balance) public {
        if(balances[admin] < _balance){
            revert("Wrong balance");
        }else{
            balances[admin] -= _balance;
            balances[_to] += _balance; 
        }
    }

    struct Person{
        string name;
        uint age;
    }

    mapping(address => Person) public persons;

    function setPerson(address _address, string memory _name, uint _age) public OnlyAdmin{
        persons[_address].name = _name;
        persons[_address].age =_age;
    }

    function setPersonData(address _address, string memory _name, uint _age) public OnlyAdmin{
        persons[_address].name = _name;
        persons[_address].age =_age;
    }
}