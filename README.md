# TaskBoard 🗂️

A decentralized on-chain task management smart contract built with Solidity. Users can add, update, retrieve, and delete tasks with persistent storage on the Ethereum blockchain.

## 🚀 Overview

**TaskBoard** allows users to:

- Add new tasks with a name and description
- Mark tasks as completed or incomplete
- Update task details
- Delete tasks from the board
- Retrieve task details and list all task IDs

This contract stores data transparently and immutably using Ethereum smart contract logic.

---

## 🛠️ Built With

- [Solidity ^0.8.0](https://soliditylang.org/)
- [Remix IDE](https://remix.ethereum.org/)
- [Ethereum Virtual Machine (EVM)](https://ethereum.org/en/developers/docs/evm/)

---

## 📄 Smart Contract Functions

### 🔹 `addTask(string name, string description)`

Adds a new task with the provided name and description.

### 🔹 `updateTask(uint taskId, string name, string description, bool isCompleted)`

Updates the task details and marks it as completed or incomplete.

### 🔹 `deleteTask(uint taskId)`

Deletes the task from storage and updates the task ID array accordingly.

### 🔹 `getTask(uint taskId) → (string, string, bool)`

Returns task details for a given ID.

### 🔹 `getAllTaskIds() → uint[]`

Returns an array of all task IDs currently stored.

---

## ⚙️ Events

- `TaskAdded(uint taskId, string name, string description)`
- `TaskUpdated(uint taskId, string name, string description, bool isCompleted)`
- `TaskDeleted(uint taskId)`

These events help frontends track real-time state changes.

---

## 📦 Deployment

You can deploy and test the contract using:

- **Remix IDE** (recommended for quick testing)
- **Hardhat** or **Truffle** (for full-stack dApp development)

---

## 💡 Example Usage

```solidity
taskBoard.addTask("Deploy Contracts", "Deploy the TaskBoard contract to Sepolia");
taskBoard.updateTask(0, "Deploy Contracts", "Deployment completed", true);
taskBoard.getTask(0); // returns ("Deploy Contracts", "Deployment completed", true)
