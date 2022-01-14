// const { assert, should, expect } = require("chai");
// const truffleAssert = require('truffle-assertions');

const assert  = require('console');
const Web3 = require('web3');
const web3 = new Web3(new Web3.providers.HttpProvider('http://localhost:7545'));

const ether = 10**18; // 1 ether = 1000000000000000000 wei

const Donation = artifacts.require("./Donation.sol");

contract("Donation", accounts => {
  before(async() => {
    this.donation= await Donation.deployed();
  });
    const alice= accounts[0];
    const bob = accounts[1];
    const marcus = accounts[2];
    const deGea = accounts[3];

    it("deploys successfully", async()=>{
      const address= await this.donation.address;
      // assert.notEqual(address,0x0);
      // assert.notEqual(address,"");
      // assert.notEqual(address,null);
      // assert.notEqual(address,undefined);
      console.log(address);

  });

    // it("Should create a new charity and return it", async()=>{
    //   const newCharity= await this.donation.addCharity("alice", "i like recieving help", "today",{from:alice});
    //   const charity= await this.donation.getCharity(0);
    //   console.log(charity);
    //   // assert.Equal("alice",charity.name);
    //   // assert.Equal("i like recieving help",charity.description);
    //   // assert.Equal("today",charity.date);
    //   // assert.Equal(alice,charity.charityaddr);
    
    // });

    // it("Should create a new donor and return the donor list", async()=>{
    //   const newDonor= await this.donation.addDonors(0,"Donor1",10); 
    //   const donorList= await this.donation.getdonors();
    //   console.log(donorList);
    //   // const charity= await this.donation.getCharity(0);
    //   // console.log(charity);
    
    // });

    it("Should donate from one donor account to another charity account",async()=>{
      var amountD= 2*ether; 
      const newCharity= await this.donation.addCharity("alice", "i like recieving help", "today",{from:alice});
      const charityBalance= await this.donation.getCharityBalance(0);
      console.log("Charity Balance here: ", charityBalance.toNumber());
      const charities= await this.donation.getCharities();
      console.log("Charities here: ", charities);
      const newDonor= await this.donation.addDonors(0,"Donor2",10,{from:bob});
      const donorBalance= await this.donation.getDonorBalance(0);
      console.log("Donor Balance here: ", donorBalance.toNumber());
      const donors= await this.donation.getdonors();  
      console.log("Donors here: ",donors);
      const donated= await this.donation.donate(0,0,bob,alice,10,{from:bob,value:amountD}); 
      // console.log("After donation here: ", donated);
      const newCharityBalance= await this.donation.getCharityBalance(0);
      console.log("Charity Balance after donation here: ", newCharityBalance.toNumber());
      const newDonorBalance= await this.donation.getDonorBalance(0);
      console.log("Donor Balance after donation here: ", newDonorBalance.toNumber());

    });



    // it("...should store the value 89.", async () => {
    
    // // add charity account
    // // addCharity(string memory name,string memory description, string memory date) public {
        
    // donation.addCharity("alice", "i like recieving help", "today");
    

    // assert.equal(storedData, 89, "The value 89 was not stored.");
  // });
});