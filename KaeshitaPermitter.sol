pragma solidity ^0.5.1;

import "./KaeshitaCreator.sol";

contract KaeshitaPermitter is KaeshitaCreator{
    function permitKaeshita(uint _id, bool _isReturned) public returns (bool) {
        Kaeshita newKaeshita = kaeshitas[_id];
        
        require(newKaeshita.isreturned == false);
        
        if (newKaeshita.isreturned == true) {
            return true;
        }
        
        if (_isReturned == false) {
            return false;
        }
        
        kaeshitas[_id].isreturned = true;
        return true;
    }
    
    function getPermittedData(uint _id) public returns (bool) {
        return kaeshitas[_id].isreturned;
    }
}