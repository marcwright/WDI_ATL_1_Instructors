//=========== CHECKING ===============//
// grabs whatever is in the account and assigns it to local variable 'balance'
var checkingBalance = document.getElementById('checking-balance');
var inputCheck = document.querySelector('#checking-amount');
var checkingDeposit = document.querySelector('#checking-deposit');
var checkingWithdraw = document.querySelector('#checking-withdraw');

checkingDeposit.addEventListener('click', function(){
  //capture integer in the input field, assign that value to a local variable
  var input = parseInt(inputCheck.value);
  //parse exisiting 'balance' variable to an integer
  var balance = parseInt(checkingBalance.textContent.substring(1));
  //then add (+=) the local variable to the existing balance    
  balance += input;
  //place the value of the balance variable (textContent) into the checking balance field
  checkingBalance.textContent = '$' + balance;
});

checkingWithdraw.addEventListener('click', function(){
  var input = parseInt(inputCheck.value);
  var balance = parseInt(checkingBalance.textContent.substring(1));
  if (balance > input) {
    balance -= input;
    checkingBalance.textContent = '$' + balance;
  }
});

//=========== SAVINGS ===============//
var savingsBalance = document.getElementById('savings-balance');
var inputSave = document.querySelector('#savings-amount');
var savingsDeposit = document.querySelector('#savings-deposit');
var savingsWithdraw = document.querySelector('#savings-withdraw');

savingsDeposit.addEventListener('click', function(){
  var input = parseInt(inputSave.value);
  var balance = parseInt(savingsBalance.textContent.substring(1));
  balance += input;
  savingsBalance.textContent = '$' + balance;
});

savingsWithdraw.addEventListener('click', function(){
  var input = parseInt(inputSave.value);
  var balance = parseInt(savingsBalance.textContent.substring(1));
  if (balance > input) {
    balance -= input;
    savingsBalance.textContent = '$' + balance;
  }
});

