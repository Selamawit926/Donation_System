pragma solidity ^0.8.11;

contract Donors{
    uint public donorsCount=0;

    DonorsInfo[] public donors;
    struct DonorsInfo{
        uint id;
        string name;
        uint amountDonated=0;
        string[] history;
        bool transfered;
    }
    
    // address of donors which is there id
    
    // mapping(uint => DonorsInfo)  public donors;
    // array of history
    // donate function
    // function donate(uint  _amountDonated) public returns(uint){
    //     // donors[id] ;
    //     // return _amountDonated;
         
    // }
    // addDonor
    function adddonors(string _name,   uint  _amountDonated) public {
        donorsCount++;
        string[] memory _history = new string[](100);
        donors[donorsCount] = DonorsInfo(donorsCount,_name,_amountDonated,_history, false);
    }
    // getdonors
    function getdonors() public view returns (DonorsInfo[] memory){
        return donors;
    }
    function getdonor(uint id) public view returns (DonorsInfo memory){
        return donors[id];
    }

}
