pragma solidity <=0.8.11;
pragma experimental ABIEncoderV2;
contract Donation{
    uint public charityCount=0;
    uint public donorsCount=0;
    DonorsInfo[] public donors;
    Charity[] public charities;

    struct Charity{
        uint id;
        string name;
        string date;
        uint amountReceived;
        string description;
        string[] history;
    }

    struct DonorsInfo{
        uint id;
        string name;
        uint amountDonated;
        string[] history;
        bool transfered;
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

    function getdonors() public view returns (DonorsInfo[] memory){
        return donors;
    }

    function getdonor(uint id) public view returns (DonorsInfo memory){
        return donors[id];
    }

    function addDonors(uint charity_id,string memory donorName) public {
        donorsCount++;
        string[] memory _history = new string[](100);
        donors[donorsCount] = DonorsInfo(donorsCount,donorName,0,_history, false);
        charities[charity_id].history.push(donorName);
    }

    // function donate(address fromAddress, address toAddress,uint charity_id) public{
        
    // }
}