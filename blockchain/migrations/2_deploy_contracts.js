// 2_deploy_contracts.js
const AccessControlContract = artifacts.require("AccessControlContract");
const AppointmentContract = artifacts.require("AppointmentContract");
const PatientContract = artifacts.require("PatientContract");
const MedicalRecords = artifacts.require("MedicalRecords");

module.exports = function(deployer) {
  deployer.deploy(AccessControlContract);
  deployer.deploy(AppointmentContract);
  deployer.deploy(PatientContract);
  deployer.deploy(MedicalRecords);
};