pragma solidity ^0.4.0;

//Create file Ecrow.sol and create 3 variables: a buyer, a seller, and a resolver
contract Escrow {
    // email edit function....
 // mapping(address => uint) public balances;
 // mapping(address => string) public profile;

//Array of members
//members [] 
//mapping (Escrow_ID => members)

        address seller;
        address buyer;
        address resolver;
        uint price;
        string email;
        string title;
        string productURL;
        string productDescription;
  function Escrow (address _seller, address _buyer, address _resolver, uint _price,  string _email,string _title, string _productURL, string _productDescription) 
  {
        seller = _seller;
        buyer = _buyer;
        resolver = _resolver;
        price = _price;
        email = _email;
        title = _title;
        productURL= _productURL;
        productDescription = _productDescription;
  }
  
  function deposit() payable returns (bool) {
       return true;
  }
     
  function payoutToSeller() {
    if(msg.sender == buyer || msg.sender == resolver) {
      seller.transfer(this.balance);
      // payout to the resolver
    }
  }
  
  function refundToBuyer() {
    if(msg.sender == seller || msg.sender == resolver) {
      buyer.transfer(this.balance);
      // payout to the resolver
    }
  }
  
  function getBalance() constant returns (uint) {
    return this.balance;
  }

}
