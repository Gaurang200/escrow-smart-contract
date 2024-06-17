# Escrow Smart Contract

## Overview

This Solidity smart contract implements an escrow system where a third party (arbiter) manages assets between a buyer and a seller until certain conditions are met. It ensures security and fairness in transactions where trust between parties may be limited.

### Features

- **Participants:**
  - **Buyer:** Initiates the transaction and confirms payment.
  - **Seller:** Provides the goods or services and confirms delivery.
  - **Arbiter:** Acts as a neutral third party to resolve disputes if needed.

- **Workflow:**
  1. **Initialization:**
     - The contract is deployed with addresses of the buyer and seller.
     - The arbiter is set as the contract deployer.

  2. **Payment Stage:**
     - The buyer sends funds to the contract and confirms payment.
     - Funds are held securely in the contract until delivery confirmation.

  3. **Delivery Stage:**
     - The seller confirms delivery of goods or services.
     - Funds held in escrow are transferred to the seller upon delivery confirmation.

  4. **Dispute Resolution:**
     - If there is a dispute, the arbiter can intervene to resolve it fairly.
     - The arbiter has the authority to decide on fund distribution based on the evidence provided.

### Smart Contract Details

- **State Variables:**
  - `buyerAddress`, `sellerAddress`, `arbiterAddress`: Addresses of the buyer, seller, and arbiter respectively.
  - `currentState`: Enum representing the current state of the contract (`AWAITING_PAYMENT`, `AWAITING_DELIVERY`, `COMPLETE`).

- **Functions:**
  - `confirmPayment()`: Called by the buyer to confirm payment.
  - `confirmDelivery()`: Called by the buyer or arbiter to confirm delivery and release funds to the seller.
  - `returnPayment()`: Called by the seller to return funds to the buyer in case of a dispute or cancellation.

### How to Use

1. **Deploy the Contract:**
   - Deploy the contract with the addresses of the buyer and seller.
   - Set the arbiter as the contract deployer.

2. **Transaction Workflow:**
   - **Buyer:** Initiates the transaction by sending funds to the contract using `confirmPayment()`.
   - **Seller:** Confirms delivery of goods or services using `confirmDelivery()`.
   - **Arbiter:** Acts as a mediator in case of disputes, ensuring fair resolution.

3. **Dispute Resolution:**
   - In case of disputes, the arbiter can review evidence and make a decision using the provided functionalities.

### About Escrow

An escrow is a financial arrangement where a third party holds and regulates payment of the funds required for two parties involved in a given transaction. It helps ensure that transactions are conducted securely and fairly.

### Security Considerations

- Ensure that only trusted addresses are set as the arbiter to prevent biased decisions.
- Use the contract on trusted networks to avoid potential attacks or security vulnerabilities.
