var Charities = artifacts.require("./Charities.sol");

module.exports = function(deployer) {
  deployer.deploy(Charities);
};
