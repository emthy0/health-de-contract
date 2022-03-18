// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13; 

contract Patient {

  address[] private addresses;
  bytes16[] private usernames;
  bytes[] private ipfsHashes;
  string private name = "Ire";
  struct PatientHealthStruct {
    bytes32 bloodType;
    uint age;
  }

  struct PatientStruct {
    string email;
    string firstname;
    string lastname;
  }

  mapping(address => PatientStruct) private patients;
  mapping(address => uint) private addressToIndex;
  mapping(bytes16 => uint) private usernameToIndex;


  function getName() public view returns (string memory) {
      return name;
  }

  function setName(string memory newName) public  {
      name = newName;
  }


  function addPatient(address _userAddress, string memory email,string memory firstname, string memory lastname ) public {
    // PatientStruct storage patient = patients[_userAddress];
    patients[_userAddress] = PatientStruct({
      email: email,
      firstname: firstname,
      lastname: lastname
    });
  }

  function getPatient(address _userAddress) public view returns (string memory email,string memory firstname,string memory lastname) {
    // require(msg.sender == _userAddress);
    PatientStruct storage patient = patients[_userAddress];
    // email = patient.email;
    // firstname = patient.firstname;
    // lastname = patient.lastname;
    return (
      patient.email,
      patient.firstname,
      patient.lastname
    );
  }

  function getEmail(address _userAddress) public view returns (string memory) {
    require(msg.sender == _userAddress);
    PatientStruct storage patient = patients[_userAddress];
    return patient.email;
  }





}