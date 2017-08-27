pragma solidity ^0.4.0;

//Create file Escrow.sol and create 3 variables: a buyer, a seller, and a resolver
contract Escrow {
    // email edit function....
    
  address public buyer;
  address public seller;
  address public resolver;
  
 // mapping(address => uint) public balances;
 // mapping(address => string) public profile;
  
   struct contractDetails{
        address seller;
        address buyer;
        address resolver;
        uint price;
        string email;
        string title;
        string productURL;
        string productCondition;
    }
  contractDetails cD;
  function Escrow (address _seller, address _buyer, address _resolver, uint _price,  string _email,string _title, string _productURL, string _productCondition) payable 
  {
  cD = contractDetails (_seller, _buyer, _resolver, _price, _email, _title, _productURL, _productCondition);
  }
  
  function deposit() payable returns (bool) {
       return true;
  }
     
  function payoutToSeller() {
    if(msg.sender == buyer || msg.sender == resolver) {
      seller.transfer(this.balance);
    }
  }
  
  function refundToBuyer() {
    if(msg.sender == seller || msg.sender == resolver) {
      buyer.transfer(this.balance);
    }
  }
  
  function getBalance() constant returns (uint) {
    return this.balance;
  }

}
