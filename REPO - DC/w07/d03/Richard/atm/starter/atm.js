/*
* @Author: Richard Hessler
* @Date:   2014-06-04 17:36:16
* @Last Modified by:   Richard Hessler
* @Last Modified time: 2014-06-04 23:50:09
*/

// - As a user, I want to deposit money into one of the bank accounts
// Deposit to checking

///////////////////////////////
// Checking variables
//////////////////////////////

var currCheckBal = document.getElementById('checking-balance');
var checkDepositButton = document.getElementById('checking-deposit');
var checkAmount = document.getElementById('checking-amount');
var checkWithButton = document.getElementById('checking-withdraw');
var newCheckBal = 0;

//////////////////////////////
// Savings Variables
//////////////////////////////

var currSavBal = document.getElementById('savings-balance');
var savDepositButton = document.getElementById('savings-deposit');
var savAmount = document.getElementById('savings-amount');
var savWithButton = document.getElementById('savings-withdraw');

// Checking desposit Function
checkDepositButton.addEventListener('click', function(){
  var oldCheckBal = parseInt(currCheckBal.textContent.substr(1))
  var newCheckBal = (parseInt(checkAmount.value) + oldCheckBal);
  currCheckBal.textContent = "$" + newCheckBal;
});

// - As a user, I want to withdraw money from checking account
// - As a user, I want to have overdraft protection from my checking to my savings
// - As a user, I do not want my account to go below zero
// Checking withdraw function

checkWithButton.addEventListener('click', function(){
  var oldCheckBal = parseInt(currCheckBal.textContent.substr(1));
  var checkAmtValue = parseInt(checkAmount.value)

  if (oldCheckBal >= checkAmtValue) {
    newCheckBal = (oldCheckBal - parseInt(checkAmount.value));
    currCheckBal.textContent = "$" + newCheckBal;
    checkForZero();
  } else if (parseInt(currSavBal.textContent.substr(1)) >= checkAmtValue){
      currCheckBal.textContent = "$0";
      checkForZero();
      var newWithAmount = parseInt(currCheckBal.textContent.substr(1)) - checkAmtValue;
      currSavBal.textContent = "$" + (parseInt(currSavBal.textContent.substr(1)) + newWithAmount);
    }
  });

// Savings desposit Function
savDepositButton.addEventListener('click', function(){
  var oldSavBal = parseInt(currSavBal.textContent.substr(1))
  var newSavBal = (parseInt(savAmount.value) + oldSavBal);
  currSavBal.textContent = "$" + newSavBal;
});

// - As a user, I want to withdraw money from savings account
// - As a user, I want over draft protection from my savings to my checking
// - As a user, I do not want my account to go below zero
// Savings withdraw Function

savWithButton.addEventListener('click', function(){
  var oldSavBal = parseInt(currSavBal.textContent.substr(1));
  var savValue = parseInt(savAmount.value);

   if (oldSavBal >= savValue) {
  newSavBal = (oldSavBal - savValue);
  currSavBal.textContent = "$" +newSavBal;
  checkForZero();
} else if (parseInt(currCheckBal.textContent.substr(1)) >= savValue){
      currSavBal.textContent = "$0";
      checkForZero();
      var newSavWithAmount = parseInt(currSavBal.textContent.substr(1)) - savValue;
      currCheckBal.textContent = "$" + (parseInt(currCheckBal.textContent.substr(1)) + newSavWithAmount);
    }
});

function checkForZero() {
  var color = document.getElementById('account')
  if (oldSavBal === 0 || oldCheckBal === 0){
    color.classList.add('zero');
  } else {
    color.createAttribute('account');
  }
}


// - As a user, I want the color of my back account to reflect it's balance (there's a CSS class called .zero already written for this!)
