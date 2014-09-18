

/////////  Checking Deposit Variables //////////
checkingBalance = document.getElementById('checking-balance');
checkingDepositAmount = document.getElementById('checking-amount');
checkingDepositButton = document.getElementById('checking-deposit');


/////////  Savings Deposit Variables //////////
savingsBalance = document.getElementById('savings-balance');
savingsDepositAmount = document.getElementById('savings-amount');
savingsDepositButton = document.getElementById('savings-deposit');

updateDisplay();

  checkingDepositButton.addEventListener('click', function(){
    var oldCheckingBalance = parseInt(checkingBalance.textContent.substr(1))
    var newCheckingBalance = oldCheckingBalance + parseInt(checkingDepositAmount.value);
    checkingBalance.textContent = "$" + newCheckingBalance;
  updateDisplay();
  });

  savingsDepositButton.addEventListener('click', function(){
    var oldSavingsBalance = parseInt(savingsBalance.textContent.substr(1))
    var newSavingsBalance = oldSavingsBalance + parseInt(savingsDepositAmount.value);
    savingsBalance.textContent = "$" + newSavingsBalance;
  updateDisplay();
  });

////////////// Checking Withdraw ///////////////////////////
checkingWithdrawAmount = document.getElementById('checking-amount');
checkingWithdrawButton = document.getElementById('checking-withdraw');

  checkingWithdrawButton.addEventListener('click', function(){
  var oldCheckingBalance = parseInt(checkingBalance.textContent.substr(1))
    if (oldCheckingBalance < parseInt(checkingWithdrawAmount.value)){
      if (parseInt(savingsBalance.textContent.substr(1)) >= parseInt(checkingWithdrawAmount.value) - oldCheckingBalance){
        var newBalance = (parseInt(savingsBalance.textContent.substr(1)) - (parseInt(checkingWithdrawAmount.value) - oldCheckingBalance));
        savingsBalance.textContent = "$" + newBalance;
        checkingBalance.textContent = "$" + 0;
      } else {
      }
    } else {
  var newCheckingBalance = oldCheckingBalance - parseInt(checkingWithdrawAmount.value);
  checkingBalance.textContent = "$" + newCheckingBalance;
  }
  updateDisplay();
});

///////////// Savings Withdraw ////////////////////////////////
savingsWithdrawAmount = document.getElementById('savings-amount');
savingsWithdrawButton = document.getElementById('savings-withdraw');

  savingsWithdrawButton.addEventListener('click', function(){
  var oldSavingsBalance = parseInt(savingsBalance.textContent.substr(1))
    if (oldSavingsBalance < parseInt(savingsWithdrawAmount.value)){
      if (parseInt(checkingBalance.textContent.substr(1)) >= parseInt(savingsWithdrawAmount.value) - oldSavingsBalance){
        var newBalance = (parseInt(checkingBalance.textContent.substr(1)) - (parseInt(savingsWithdrawAmount.value) - oldSavingsBalance));
        checkingBalance.textContent = "$" + newBalance;
        savingsBalance.textContent = "$" + 0;
      } else {
      }
    } else {
  var newSavingsBalance = oldSavingsBalance - parseInt(savingsWithdrawAmount.value);
  savingsBalance.textContent = "$" + newSavingsBalance;
  }
  updateDisplay();
});


function updateDisplay(){
  if (checkingBalance.textContent === '$0'){
    checkingBalance.classList.add('zero')
  } else {
    checkingBalance.classList.remove('zero');
  }
};


