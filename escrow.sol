// SPDX-License-Identifier: GPL-3.0 
pragma solidity >=0.4.22 <0.9.0;

contract Escrow {
    address payable public buyer;
    address payable public seller;
    address payable public arbiter;
    
    enum State {
        AwaitPayment, AwaitDelivery, Complete
    }

    State public state;
    
    modifier inState(State expectedState) {
        require(state == expectedState, "Invalid state.");
        _;
    }

    modifier onlyBuyer() {
        require(msg.sender == buyer || msg.sender == arbiter, "Only buyer or arbiter can call this.");
        _;
    }

    modifier onlySeller() {
        require(msg.sender == seller, "Only seller can call this.");
        _;
    }
    
    constructor(address payable _buyer, address payable _seller) {
        arbiter = payable(msg.sender);
        buyer = _buyer;
        seller = _seller;
        state = State.AwaitPayment;
    }
    
    function confirmPayment() public onlyBuyer inState(State.AwaitPayment) payable {
        state = State.AwaitDelivery;
    }
    
    function confirmDelivery() public onlyBuyer inState(State.AwaitDelivery) {
        seller.transfer(address(this).balance);
        state = State.Complete;
    }

    function returnPayment() public onlySeller inState(State.AwaitDelivery) {
        buyer.transfer(address(this).balance);
    }
}
