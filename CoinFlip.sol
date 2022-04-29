// This is the logic of CoinFlip.

pragma solidity ^0.6.0;

import "https://raw.githubusercontent.com/NomicFoundation/hardhat/master/packages/hardhat-core/console.sol";   // to check output in console

import "@openzeppelin/contracts-ethereum-package/contracts/math/SafeMath.sol";    // import the safeMath file

contract CoinFlip  {
    
    using SafeMath for uint256;

    uint256 lastHash;

    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;   // factor to randomally toss

    uint256 public balance;  // declare the gambler initial balance

    constructor() public {
        balance = 100;    // initialise the gambler initial balance
    }

    // Input from the FlipingCoin.sol toss and amount to bet.
    function flip(uint256 _toss, uint256 _amount_bet) public returns (bool) {

        // if amount to be bet is greater than the Balance of Gambler
        if(_amount_bet > balance){
            return false;
        }

        uint256 blockValue = uint256(blockhash(block.number.sub(1)));

        if (lastHash == blockValue) {
            revert();
        }

        console.log("hello");

        lastHash = blockValue;
        uint256 coinFlip = blockValue.div(FACTOR);
        uint256 side = coinFlip == 1 ? 1 : 0;   // random toss is generated

        // if/else for the gambler who won or lost
        if (side == _toss) {
            balance = balance + _amount_bet * 2;  // if won amount of bet is doubled
            return true;
        } 
        else{
            balance = balance - _amount_bet;    // losted the bet
            return true;
        }
    }
}