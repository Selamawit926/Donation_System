var Donors = artifacts.require("./Donors.sol");

module.exports = function(deployer) {
  deployer.deploy(Donors);
};
