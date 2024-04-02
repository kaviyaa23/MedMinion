// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;
contract AccessControlContract {
    address public admin;
    mapping(address => bool) public doctors;

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can perform this action");
        _;
    }

    modifier onlyDoctor() {
        require(doctors[msg.sender], "Only doctors can perform this action");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function addDoctor(address _doctorAddress) public onlyAdmin {
        doctors[_doctorAddress] = true;
    }

    function removeDoctor(address _doctorAddress) public onlyAdmin {
        doctors[_doctorAddress] = false;
    }
}
