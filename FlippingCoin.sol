// This is the .sol file to trigger CoinFlip.sol

pragma solidity ^0.6.0;

import "./CoinFlip.sol";

contract FlippingCoin  {
    // declare user address 
    CoinFlip public gamblerContract;

    using SafeMath for uint256;

    uint256 public toss;
    uint256 public amount_bet;
    
    // input the Gambler Contract Address , toss , and Amount to be place on bet.
    constructor(address _gamblerContract, uint256 _toss, uint256 _amount_bet) public {
        gamblerContract = CoinFlip(_gamblerContract);   // get the gambler contract address 
        toss = _toss;
        amount_bet = _amount_bet;
    }

    function flip() public returns (bool){
        gamblerContract.flip(toss, amount_bet);
    }
}