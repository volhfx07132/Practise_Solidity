pragma solidity >=0.7.0 <0.9.0;

interface Regulator{
    function checkValue(uint amount) external returns(bool);
    function loan() external returns(bool);

}

contract Bank is Regulator{
    uint private myInternalValue;
    address private onwer;
     
    constructor(uint amount) public{
        myInternalValue = amount;
        onwer = msg.sender;
    }

    modifier onwerFunc{
        require(onwer == msg.sender, "Only owner");
        _;
    }

    function deposit(uint amount) public onwerFunc{
        myInternalValue += amount;
    }

    function withdraw(uint amount) public onwerFunc{
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

contract TestThrows(){
    function testAssert(){
        assert(1 == 2);
    }
    function testRequirt(){
        require(1 == 2);
    }
    function testRevert(){
        revert("");
    }
    function testThrow(){
        throw();
    }
}