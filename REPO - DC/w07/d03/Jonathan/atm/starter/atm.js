// As a user, I want to deposit money into one of the bank accounts

var checkingDeposit = document.getElementById('checking-deposit');
var checkingWithdraw = document.getElementById('checking-withdraw');
var checkingInput = document.querySelector('#checking-amount');
var checkingBalance = document.querySelector('#checking-balance');

var savingsDeposit = document.getElementById('savings-deposit');
var savingsWithdraw = document.getElementById('savings-withdraw');
var savingsInput = document.querySelector('#savings-amount');
var savingsBalance = document.querySelector('#savings-balance');


function checkingAccountDeposit () {
  checkingDeposit.addEventListener('click', function() {
    var balance = parseInt(checkingBalance.textContent.substr(1));
    var deposit = parseInt(checkingInput.value);
    total = balance + deposit;
    checkingBalance.textContent = "$" + total;
  });
}
checkingAccountDeposit();


function savingsAccountDeposit () {
  savingsDeposit.addEventListener('click', function() {
    var balance = parseInt(savingsBalance.textContent.substr(1));
    var deposit = parseInt(savingsInput.value);
    total = balance + deposit;
    savingsBalance.textContent = "$" + total;
  });
}
savingsAccountDeposit();

// As a user, I want to withdraw money from one of the bank accounts
// Make sure the balance in an account can't go negative. If a user tries to withdraw more money than exists in the account, ignore the transaction.

function checkingAccountWithdraw () {
      checkingWithdraw.addEventListener('click', function() {
      if (total < parseInt(checkingInput.value)) {
        return
        }
      else
        var balance = parseInt(checkingBalance.textContent.substr(1));
        var deposit = parseInt(checkingInput.value);
        total = balance - deposit;
        checkingBalance.textContent = "$" + total;
    });
  }
checkingAccountWithdraw();


function savingsAccountWithdraw () {
      savingsWithdraw.addEventListener('click', function() {
      if (total < parseInt(savingsInput.value)) {
        return
        }
      else
        var balance = parseInt(savingsBalance.textContent.substr(1));
        var deposit = parseInt(savingsInput.value);
        total = balance - deposit;
        savingsBalance.textContent = "$" + total;
    });
  }
savingsAccountWithdraw();

// As a user, I want overdraft protection



// What happens when the user wants to withdraw more money from the checking account than is in the account?



// If a withdrawal can be covered by the balances in both accounts, take the balance of the account withdrawn from down to $0 and take the rest of the withdrawal from the other account.



// If the withdrawal amount is more than the combined account balance, ignore it.



// As a user, I want the color of my back account to reflect it's balance (there's a CSS class called .zero already written for this!)
