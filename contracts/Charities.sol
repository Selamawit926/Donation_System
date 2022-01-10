pragma solidity ^0.8.11;
contract Charities{
    uint public charityCount=0;
    address[] public charityAddresses;
    // mapping(uint => Charity) charities;
    Charity[] public charities;

    struct Charity{
        uint id;
        string name;
        string date;
        uint amountReceived;
        string description;
        string[] history;
    }

    function getCharity(uint id) public view returns (Charity memory) {
        return charities[id];
    }

    function getCharities() public view returns (Charity[] memory) {
        return charities;
    }

    function addCharity(string memory name,string memory description, string memory date) public {
        charityCount++;
        string[] memory history=new string[](100);
        charities.push(Charity(charityCount,name,date,0,description,history));
    }

}