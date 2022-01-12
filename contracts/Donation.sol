pragma solidity <=0.8.11;
pragma experimental ABIEncoderV2;
contract Donation{
    uint public charityCount=0;
    uint public donorsCount=0;
    address payable[] charityAddresses;
    DonorsInfo[] public donors;
    Charity[] public charities;
    // address payable charityAddresses[0]="0x44f231a56a8F23e9556638748c47C3b07e3abef4";
    // address payable charityAddresses[1]="0xb335695C56dA81a5710838fE0b4121d32E54dBF2";
    // address payable charityAddresses[2]="0xF4015f33142be961A1CA237Da0B341460e8c01ce";
    // address payable charityAddresses[3]="0x29CDF3A8C37EEfD45EA5DFcbb97FD30fC490a868";
    // address payable charityAddresses[4]="0x7cA41FF7D046Eb48e7382a25aE29AB724AA915E9";

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

    function assignAddresses(address payable charity_address) public{
        charityAddresses[charityCount]= charity_address;
    }

    function getCharityAddresses() public returns (address payable[] memory){
        return charityAddresses;
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

    function donate(uint charity_id) payable public{
        address payable charityAddress= charityAddresses[charity_id];
        charityAddress.transfer(msg.value);
    }
}