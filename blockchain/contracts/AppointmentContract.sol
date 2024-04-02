// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;

contract AppointmentContract {
    struct Appointment {
        uint256 appointmentId;
        address patientAddress;
        uint256 appointmentDate;
        string medicalProblem;
    }

    mapping(uint256 => Appointment) public appointments;
    uint256 public nextAppointmentId;

    function bookAppointment(uint256 _appointmentDate, string memory _medicalProblem) public {
        appointments[nextAppointmentId] = Appointment(nextAppointmentId, msg.sender, _appointmentDate, _medicalProblem);
        nextAppointmentId++;
    }

    function getAppointmentDetails(uint256 _appointmentId) public view returns (address, uint256, string memory) {
        Appointment memory appointment = appointments[_appointmentId];
        return (appointment.patientAddress, appointment.appointmentDate, appointment.medicalProblem);
    }
}
