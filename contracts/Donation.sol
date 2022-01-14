pragma solidity <=0.8.11;
pragma experimental ABIEncoderV2;
contract Donation{
    uint public charityCount=0;
    uint public donorsCount=0;
    DonorsInfo[] public donors;
    Charity[] public charities;
    mapping (address=>uint) public balances;
    mapping (address=> Charity) public charitym;
    mapping (address=> DonorsInfo) public donorm;
   
    struct Charity{
        uint id;
        address charityaddr;
        string name;
        string date;
        uint amountReceived;
        string description;
        string[] history;
        uint balance;
    }

    struct DonorsInfo{
        uint id;
        address donoraddr;

        string name;
        uint amountDonated;
        string[] history;
        bool transfered;
        uint balance;

    }

    event getCharitiesEv();
    event getCharityEv(uint id);
    event addCharityEv(string name, string description,  uint amountReceived, string date, string[] history);
    event getDonorsEv();
    event getDonorEv(uint id);
    event addDonorEv(uint charity_id, string name, uint amountDonated, string[] history, bool transfered);
    event donateEv (address fromAddress,  address toAddress, uint amountDonated);
    event depositMade(address charityaddr, uint amountReceived);
    event withdrawalMade(address donoraddr, uint amountDonated);

    function getCharity(uint id) public view returns (Charity memory) {
        return charities[id];
    }

    function getCharities() public view returns (Charity[] memory) {
        return charities;
    }

    function getCharityBalance(uint charity_id) public view returns (uint) {
        return charities[charity_id].balance;
    }

    function getDonorBalance(uint donor_id) public view returns (uint) {
        return donors[donor_id].balance;
    }

    function addCharity(string memory name,string memory description, string memory date) public {
        charityCount++;
        string[] memory history=new string[](100);
        charities.push(Charity(charityCount,msg.sender,name,date,0,description,history,0));
        // charitym[msg.sender]=Charity(charityCount,msg.sender,name,date,0,description,history);
        charitym[msg.sender].id = charityCount;
        charitym[msg.sender].name = name;
        charitym[msg.sender].date = date;
        charitym[msg.sender].amountReceived = 0;
        charitym[msg.sender].description = description;
        charitym[msg.sender].history = history;
        balances[msg.sender]=0;

        emit addCharityEv(name,description,0,date,history);
    }

    function getdonors() public view returns (DonorsInfo[] memory){
        return donors;
    }
```
    function getdonor(uint id) public view returns (DonorsInfo memory){
        return donors[id];
    }

    function addDonors(uint charity_id,  string memory donorName, uint amountDonated) public {
        donorsCount++;
        string[] memory _history = new string[](10);
        donors.push(DonorsInfo(donorsCount, msg.sender, donorName,amountDonated,_history, true,100));
        donorm[msg.sender].id= donorsCount;
        donorm[msg.sender].name = donorName;
        donorm[msg.sender].amountDonated = amountDonated;
        donorm[msg.sender].history = _history;
        balances[msg.sender]=100;
        // charities[charity_id].history.push(donorName);
        
        emit addDonorEv(charity_id, donorName,  amountDonated, _history,  true);
        
    }

    function donate(uint charity_id, uint donor_id, address payable fromAddress, address payable toAddress,uint amountDonated) public payable{
        // addDonors(charity_id, donorName, amountDonated);
        withdraw(fromAddress, amountDonated,donor_id);
        toAddress.transfer(msg.value);
        deposit(toAddress, amountDonated,charity_id);
        emit donateEv(fromAddress,  toAddress, amountDonated);
        // uint[] memory amounts = new uint[](2);
        // amounts[0]=withdrawalAmount;
        // amounts[1]=depositedAmount;
        
        // return charities[charity_id].balance;
    }

    function deposit(address payable charityaddr, uint amountReceived, uint charity_id) public returns (uint){
        charities[charity_id].balance += amountReceived;
        // balances[charityaddr] += amountReceived;
        emit depositMade(charityaddr, amountReceived);
        return charities[charity_id].balance;
    }
    function withdraw(address payable donoraddr, uint amountDonated, uint donor_id) public returns (uint){
        require(amountDonated <= donors[donor_id].balance,"I'm an error");
        donors[donor_id].balance -= amountDonated;
        // balances[donoraddr] -= amountDonated;
        // donoraddr.transfer(amountDonated);
        emit withdrawalMade(donoraddr,amountDonated);
        return donors[donor_id].balance;
    }
    
}