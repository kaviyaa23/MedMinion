// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;
contract PatientContract {
    struct Patient {
        uint256 patientId;
        string name;
        string email;
        string phoneNumber;
        string[] allergies;
        string medicalHistory;
    }

    mapping(address => Patient) public patients;
    uint256 public nextPatientId;

    function createPatient(string memory _name, string memory _email, string memory _phoneNumber, string[] memory _allergies, string memory _medicalHistory) public {
        patients[msg.sender] = Patient(nextPatientId, _name, _email, _phoneNumber, _allergies, _medicalHistory);
        nextPatientId++;
    }

    function getPatientDetails() public view returns (uint256, string memory, string memory, string memory, string[] memory, string memory) {
        Patient memory patient = patients[msg.sender];
        return (patient.patientId, patient.name, patient.email, patient.phoneNumber, patient.allergies, patient.medicalHistory);
    }
}
