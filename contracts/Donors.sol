pragma solidity ^0.8.11;

contract Donors{
    uint public donorsCount=0;
    struct DonorsInfo{
        uint id;
        string name;
        uint amountDonated;
        string[] history;
        bool transfered;
       
        // i dont think we need transfered bool in the time of creating a donor
    }
    
    // address of donors which is there id
    address[] public donors;
    // mapping(uint => DonorsInfo)  public donors;
    // test
    constructor() public{
        adddonors(
            "here"
        );
    }
    // array of history
    // donate function
    // function donate(uint  _amountDonated) public returns(uint){
    //     // donors[id] ;
    //     // return _amountDonated;
         
    // }
    // addDonor
    function adddonors(string memory _name,  string[] memory _history, uint _amountDonated) public {
        donorsCount++;
        donors[donorsCount] = DonorsInfo(donorsCount,_name,_amountDonated,_history, false);
    }
    // getdonors
    function getdonors() public view returns (DonorsInfo[] memory){
        return donors;
    }
    function getdonor(uint id) public view returns (DonorsInfo[] memory){
        return donors[id];
    }

}
