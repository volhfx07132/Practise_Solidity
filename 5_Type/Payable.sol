pragma solidity >=0.7.0 <0.9.0;

contract Payable{
    address payable public owner;
    
    event depositEvent(address sender, uint amonnt, uint balance);
    event withdrawEvent(uint amonnt, uint balance);
    event tranferEvent(address from, address to, uint amonnt);

    constructor() public payable {
        owner = payable(msg.sender);
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "Only Owner");
        _;
    }

    function deposit() public payable {
        emit depositEvent(msg.sender, msg.value, address(this).balance);
    }

    function notPayable() public {

    }

    function withdraw(uint _amount) public payable onlyOwner {
        owner.transfer(_amount);
        emit withdrawEvent(_amount, owner.balance);
    }

    function getBalance() public view returns(uint) {
        return owner.balance;
    }

}