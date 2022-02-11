pragma solidity >=0.7.0 <0.9.0;

interface Regulator{
    function checkValue(uint amount) external returns(bool);
    function loan() external returns(bool);

}

contract Bank is Regulator{
    uint private myInternalValue;

    constructor(uint amount) public{
        myInternalValue = amount;
    }

    function deposit(uint amount) public {
        myInternalValue += amount;
    }

    function withdraw(uint amount) public {
        if(checkValue(amount)){
           myInternalValue -= amount;
        }else{
            revert("balance not enough");
        }     
    }

    function balance() public view returns(uint) {
        return myInternalValue;
    }
    function checkValue(uint amount) override public virtual view returns(bool){
        return amount < myInternalValue;
        
    }
    function loan() override virtual public view returns(bool){
        return myInternalValue > 0;
    }
}

contract MyFirstContract is Bank(10){
    string private name;
    uint private age;

    function setName(string memory _name) public {
        name = _name;
    }

    function getName() public view returns(string memory){
        return name;
    }

    function setAge(uint _age) public {
        age = _age;
    }

    function getAge() public view returns(uint){
        return age;
    }

    function checkValue(uint amount) override public view returns(bool){
        return true;
    }
    function loan() override public view returns(bool){
        return true;
    }
}