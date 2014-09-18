/*
* @Author: stephenstanwood
* @Date:   2014-06-04 17:39:15
* @Last Modified by:   stephenstanwood
* @Last Modified time: 2014-06-04 19:41:47
*/

// JS to set up functionality

var checking = 0;
var savings = 0;

function setUpCheckingDepositButton() {
  var d = document.getElementById( 'checking-deposit' );
  d.addEventListener( 'click', function ( e ) {
    var a = parseInt( document.getElementById( 'checking-amount' ).value );
    depositToChecking( a );
  });
}

function setUpSavingsDepositButton() {
  var s = document.getElementById( 'savings-deposit' );
  s.addEventListener( 'click', function ( e ) {
    var a = parseInt( document.getElementById( 'savings-amount' ).value );
    depositToSavings( a );
  });
}

function setUpCheckingWithdrawButton() {
  var d = document.getElementById( 'checking-withdraw' );
  d.addEventListener( 'click', function ( e ) {
    var a = parseInt( document.getElementById( 'checking-amount' ).value );
    withdrawFromChecking( a );
  });
}

function setUpSavingsWithdrawButton() {
  var s = document.getElementById( 'savings-withdraw' );
  s.addEventListener( 'click', function ( e ) {
    var a = parseInt( document.getElementById( 'savings-amount' ).value );
    withdrawFromSavings( a );
  });
}

// invoke set-up functions
setUpCheckingDepositButton();
setUpSavingsDepositButton();
setUpCheckingWithdrawButton();
setUpSavingsWithdrawButton();

// JS helper methods

function format( num ) {
  return '$' + num.toFixed( 2 );
}

// pretty-prints a specified amount of money in a given field
function dispCheckingBal() {
  var bal = document.getElementById( 'checking-balance' );
  bal.textContent = format( checking );

  // update background color to reflect new balance
  var acct = document.getElementById( 'checking' );
  if ( checking === 0 ) {
    acct.classList.add( 'zero' );
  } else {
    acct.classList.remove( 'zero' );
  }
}

function dispSavingsBal() {
  var bal = document.getElementById( 'savings-balance' );
  bal.textContent = format( savings );

  // update background color to reflect new balance
  var acct = document.getElementById( 'savings' );
  if ( savings === 0 ) {
    acct.classList.add( 'zero' );
  } else {
    acct.classList.remove( 'zero' );
  }
}

function depositToChecking( amt ) {
  checking += amt;
  dispCheckingBal();
}

function depositToSavings( amt ) {
  savings += amt;
  dispSavingsBal();
}

function withdrawFromChecking( amt ) {
  if ( amt > checking + savings )  return;

  // overdraft protection case -- cover difference from savings
  if ( amt > checking ) {
    savings -= ( amt - checking );
    checking = 0;
    dispCheckingBal();
    dispSavingsBal();
    return;
  }

  // normal withdrawal
  checking -= amt;
  dispCheckingBal();
}

function withdrawFromSavings( amt ) {
  if ( amt > savings )  return;

  savings -= amt;
  dispSavingsBal();
}
