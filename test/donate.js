const { assert, should, expect } = require("chai");
const truffleAssert = require('truffle-assertions');

const Web3 = require('web3');
const web3 = new Web3(new Web3.providers.HttpProvider('http://localhost:7545'));

const ether = 10**18; // 1 ether = 1000000000000000000 wei

const Donation = artifacts.require("./Donation.sol");

contract("Donation", accounts => {
    const alice= accounts[0];
    const bob = accounts[1];
    const marcus = accounts[2];
    const deGea = accounts[3];
  
    it("...should store the value 89.", async () => {
    const donation = await Donation.deployed();
    // add charity account
    // addCharity(string memory name,string memory description, string memory date) public {
        
    donation.addCharity("alice", "i like recieving help", "today");
    

    assert.equal(storedData, 89, "The value 89 was not stored.");
  });
});
