//// Checking
// Display Balance
var checkingBalance = document.querySelector('#checking-balance');
// Input field
var checkingAmount = document.querySelector('#checking-amount');
// Button to deposit
var checkingDeposit = document.querySelector('#checking-deposit');
// Button to withdraw
var checkingWithdraw = document.querySelector('#checking-withdraw');
////

//// Savings
// Display Balance
var savingsBalance = document.querySelector('#savings-balance');
// Input field
var savingsAmount = document.querySelector('#savings-amount');
// Button to deposit
var savingsDeposit = document.querySelector('#savings-deposit');
// Button to withdraw
var savingsWithdraw = document.querySelector('#savings-withdraw');
////

//// Zero
var zero = document.querySelector('.balance');

// Total Current Checking Balance
var cBalance = parseInt(0);
// Total Current Savings Balance
var sBalance = parseInt(0);

function addChecking() {
  checkingDeposit.addEventListener('click', function(e) {
    e.preventDefault();
    var cAmount = checkingAmount.value;
    cBalance += parseInt(cAmount);
    checkingBalance.textContent = '$' + cBalance;
  });
}

function addSavings() {
  savingsDeposit.addEventListener('click', function(e) {
    e.preventDefault();
    var sAmount = savingsAmount.value;
    sBalance += parseInt(sAmount);
    savingsBalance.textContent = '$' + sBalance;
  });
}

function withdrawChecking() {
  checkingWithdraw.addEventListener('click', function(e) {
    e.preventDefault();
    var cAmount = checkingAmount.value;
    if (cBalance >= parseInt(cAmount) && cBalance >= 0) {
      cBalance -= parseInt(cAmount);
      checkingBalance.textContent = '$' + cBalance;
    } else if (sBalance > cAmount) {
      cBalance = cAmount - sBalance;
      checkingBalance.textContent = '$' + cBalance;
    }
  });
}

function withdrawSavings() {
  savingsWithdraw.addEventListener('click', function(e) {
    e.preventDefault();
    var sAmount = savingsAmount.value;
    if (sBalance >= parseInt(sAmount) && sBalance >= 0) {
      sBalance -= parseInt(sAmount);
      savingsBalance.textContent = '$' + sBalance;
    } else if (cBalance > sAmount) {
      sBalance = sAmount - cBalance;
      savingsBalance.textContent = '$' + sBalance;
    }
  });
}

function redZone() {
  if (sBalance = 0) {
    zero.style.backgroundColor = 'red';
  }
  if (cBalance = 0) {
    zero.style.backgroundColor = 'red';
  }
}

addSavings();
addChecking();
withdrawSavings();
withdrawChecking();
redZone();


