pragma solidity <=0.8.11;
pragma experimental ABIEncoderV2;
contract Donation{
    uint public charityCount=0;
    uint public donorsCount=0;
    DonorsInfo[] public donors;
    Charity[] public charities;

    struct Charity{
        uint id;
        address charityaddr;
        string name;
        string date;
        uint amountReceived;
        string description;
        string[] history;
    }

    struct DonorsInfo{
        uint id;
        address donoraddr;

        string name;
        uint amountDonated;
        string[] history;
        bool transfered;
    }
    mapping (address=>uint) private balances;
    function getCharity(uint id) public view returns (Charity memory) {
        return charities[id];
    }

    function getCharities() public view returns (Charity[] memory) {
        return charities;
    }

    function addCharity(string memory name,string memory description, string memory date) public {
        charityCount++;
        string[] memory history=new string[](100);
        charities.push(Charity(charityCount,msg.sender,name,date,0,description,history));
        
    }

    function getdonors() public view returns (DonorsInfo[] memory){
        return donors;
    }

    function getdonor(uint id) public view returns (DonorsInfo memory){
        return donors[id];
    }

    function addDonors(uint charity_id,  string memory donorName) public {
        donorsCount++;
        string[] memory _history = new string[](100);
        donors[donorsCount] = DonorsInfo(donorsCount, msg.sender, donorName,0,_history, false);
        charities[charity_id].history.push(donorName);
    }

    function donate(address fromAddress, address toAddress,uint amountDonated) public{
        withdraw(fromAddress, amountDonated);
        deposite(toAddress, amountDonated);
    }

    function deposite(address charityaddr, uint amountReceived) public payable returns (uint){
        balances[charityaddr] += amountReceived;
        // emit depositemade(charityaddr, amountReceived) event here
        return balances[charityaddr];
    }
    function withdraw(address  donoraddr, uint amountDonated) public returns (uint){
        require(amountDonated <= balances[donoraddr],"err");
        balances[donoraddr] -= amountDonated;
        // donoraddr.transfer(amountDonated);
        return balances[donoraddr];
        
    }
    
}