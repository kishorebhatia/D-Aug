pragma solidity ^0.4.0;

contract decentralisedEscrow {

	 struct escrow {
	    uint deadline;
        address seller;
        address buyer;
        address resolver;
        uint price;
        string email;
        string title;
        string productURL;
        string productDescription;
	 }
        mapping(uint => escrow) Escrows;
	    uint numEscrows;

	function createEscrow (uint timeLimit, address _seller, address _buyer, address _resolver, uint _price,  string _email,string _title, string _productURL, string _productDescription) returns (uint escrowID){
		escrowID = numEscrows++;
		Escrows[escrowID].deadline = block.number + timeLimit;
		Escrows[escrowID].buyer = _buyer;
		Escrows[escrowID].seller = _seller;
		Escrows[escrowID].resolver = msg.sender;
		Escrows[escrowID].price = _price;
		Escrows[escrowID].email = _email;
		Escrows[escrowID].title = _title;
		Escrows[escrowID].productURL = _productURL;
		Escrows[escrowID].productDescription = _productDescription;
	}

  function deposit() payable returns (bool) {
       return true;
  }
     
  function payoutToSeller(uint id) returns(string) {
    escrow e = Escrows[id];
    if(msg.sender == e.buyer || msg.sender == e.resolver) {
      e.seller.transfer(this.balance);
      // payout to the resolver
    }
  }
  
  function refundToBuyer(uint id) returns(string) {
    escrow e = Escrows[id];
    if(msg.sender == e.seller || msg.sender == e.resolver) {
      e.buyer.transfer(this.balance);
      // payout to the resolver
    }
  }
  
  function getBalance() constant returns (uint) {
    return this.balance;
  }

}
