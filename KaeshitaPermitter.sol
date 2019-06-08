pragma solidity ^0.5.1;

import "./KaeshitaCreator.sol";

contract KaeshitaPermitter is KaeshitaCreator{
    event KaeshitaPermittion(address senderAddress, address recipientAddress, uint id);
    
    function permitKaeshita(uint _id, bool _isReturned) public onlyOwner returns (bool) {
        Kaeshita memory newKaeshita = kaeshitas[_id-1];
        require(_isReturned);
        
        if (!newKaeshita.isReturned) {
            kaeshitas[_id-1].isReturned = true;
            
            emit KaeshitaPermittion(newKaeshita.senderAddress, newKaeshita.recipientAddress, _id);
        }
        
        return getPermittedData(_id);
    }
    
    function getPermittedData(uint _id) public view returns (bool) {
        return kaeshitas[_id-1].isReturned;
    }
}