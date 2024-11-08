// contracts/AntiqueVerification.sol
pragma solidity ^0.8.0;

contract AntiqueVerification {
    struct Antique {
        uint id;
        string name;
        string serialId;
        string dateOfManufacture;
        string origin;
        address owner;
        uint price;
        bool exists;
    }

    mapping(uint => Antique) public antiques;
    uint public antiqueCount;

    event AntiqueAdded(uint id, string name, string serialId, address owner);

    function addAntique(string memory _name, string memory _serialId, string memory _dateOfManufacture, string memory _origin, uint _price) public {
        antiqueCount++;
        antiques[antiqueCount] = Antique(antiqueCount, _name, _serialId, _dateOfManufacture, _origin, msg.sender, _price, true);
        emit AntiqueAdded(antiqueCount, _name, _serialId, msg.sender);
    }
}
