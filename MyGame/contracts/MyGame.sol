pragma solidity ^0.4.17;


contract IScoreStore {
    function GetScore(string name) public returns (int);
}

contract MyGame {
    function ShowScore(string name) public returns (int) {
        // Hardcoding the address below for testing
        IScoreStore scoreStore = IScoreStore(0x448F8302d64C174FDbD6fcE664849c7196B0269C);
        return scoreStore.GetScore(name);
    }
}
