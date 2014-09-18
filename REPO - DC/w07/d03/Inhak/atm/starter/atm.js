var checkingAccount = document.getElementById('checking-balance');
var checkingAmount = document.getElementById('checking-amount');
var checkingAmountDeposit = document.getElementById('checking-deposit');
var checkingAmountWithdraw = document.getElementById('checking-withdraw');

var savingsAccount = document.getElementById('savings-balance');
var savingsAmount = document.getElementById('savings-amount');
var savingsAmountDeposit = document.getElementById('savings-deposit');
var savingsAmountWithdraw = document.getElementById('savings-withdraw');

var totalBalance = parseInt(checkingAmount.value) + parseInt(checkingAccount.textContent.substr(1));

checkingAmountDeposit.addEventListener('click', function(){
  var newCheckingBalance = parseInt(checkingAmount.value) + parseInt(checkingAccount.textContent.substr(1));
  checkingAccount.textContent = "$" + newCheckingBalance;
});

savingsAmountDeposit.addEventListener('click', function(){
  var newSavingsBalance = parseInt(savingsAmount.value) + parseInt(savingsAccount.textContent.substr(1));
  savingsAccount.textContent = "$" + newSavingsBalance;
});

checkingAmountWithdraw.addEventListener('click', function(){
  var totalBalance = parseInt(checkingAccount.textContent.substr(1)) + parseInt(savingsAccount.textContent.substr(1));
  if (parseInt(checkingAmount.value) > parseInt(checkingAccount.textContent.substr(1)) && parseInt(checkingAmount.value) <= parseInt(totalBalance)){
    var leftOver = checkingAmount.value - checkingAccount.textContent.substr(1);
    checkingAccount.textContent = "$0";
    var newSavings = savingsAccount.textContent.substr(1) - leftOver;
    savingsAccount.textContent = "$" + newSavings;
  } else if (checkingAmount.value < totalBalance){
    var newCheckingBalance = parseInt(checkingAccount.textContent.substr(1)) - parseInt(checkingAmount.value);
    checkingAccount.textContent = "$" + newCheckingBalance;
  }
});

savingsAmountWithdraw.addEventListener('click', function(){
  var totalBalance = parseInt(checkingAccount.textContent.substr(1)) + parseInt(savingsAccount.textContent.substr(1));
  if (parseInt(savingsAmount.value) > parseInt(checkingAccount.textContent.substr(1)) && parseInt(savingsAmount.value) <= parseInt(totalBalance)){
    var leftOver = savingsAmount.value - savingsAccount.textContent.substr(1);
    savingsAccount.textContent = "$0";
    var newChecking = checkingAccount.textContent.substr(1) - leftOver;
    checkingAccount.textContent = "$" + newChecking;
  }
  else if (savingsAmount.value < savingsAccount.textContent.substr(1)){
    var newSavingsBalance = parseInt(savingsAccount.textContent.substr(1)) - parseInt(savingsAmount.value);
    savingsAccount.textContent = "$" + newSavingsBalance;
  }
});
