pragma solidity ^0.5.1;

import "./Ownable.sol";

contract KaeshitaCreator is Ownable {
    
    event KaeshitaCreation(address senderAddress, address recipientAddress, uint price);
    
    struct Kaeshita {
        address senderAddress;
        address recipientAddress;
        uint issueDate;
        uint dueDate;
        uint price;
        bool isReturned;
    }
    
    Kaeshita[] kaeshitas;
    
    function createKaeshita(address _senderAddress, address _recipientAddress, uint _dueDate, uint _price) public {
        uint id = kaeshitas.push(Kaeshita(_senderAddress, _recipientAddress, now, _dueDate, _price, false));
        
    emit KaeshitaCreation(_senderAddress, _recipientAddress, _price);
    
    function getKaeshita(uint _id) public returns (address, address, uint, uint, uint, bool) {
        Kaeshita newKaeshita = kaeshitas[_id];
        
        return (newKaeshita.senderAddress, newKaeshita.recipientAddress, newKaeshita.issueDate, newKaeshita.dueDate, newKaeshita.price, newKaeshita.isReturned);
    }
}