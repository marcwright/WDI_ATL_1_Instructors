var cBalance = document.getElementById('checking-balance');
var cAmount = document.getElementById('checking-amount');
var cDepositButton = document.getElementById('checking-deposit');
var cWithdrawButton = document.getElementById('checking-withdraw');
var sBalance = document.getElementById('savings-balance');
var sAmount = document.getElementById('savings-amount');
var sDepositButton = document.getElementById('savings-deposit');
var sWithdrawButton = document.getElementById('savings-withdraw');

function deposit(balance, amount, depositButton, withdrawButton) {
  depositButton.addEventListener('click', function() {
    balance.textContent = parseInt(balance.textContent) + parseInt(amount.value);
    balance.classList.remove('zero');
  })
}

function withdraw(balance, otherBalance, amount, otherAmount, depositButton, withdrawButton) {
  withdrawButton.addEventListener('click', function() {
    if (parseInt(amount.value) <= parseInt(balance.textContent)) {
      balance.textContent = parseInt(balance.textContent) - parseInt(amount.value);
    } else if (parseInt(amount.value) > parseInt(balance.textContent) && parseInt(otherAmount.value) <= parseInt(otherBalance.textContent)) {
      otherBalance.textContent = parseInt(otherBalance.textContent) - ((parseInt(amount.value) - parseInt(balance.textContent)));
      balance.textContent = 0;
      balance.classList.add('zero');
       }
  })
}

deposit(cBalance, cAmount, cDepositButton, cWithdrawButton);
deposit(sBalance, sAmount, sDepositButton, sWithdrawButton);
withdraw(cBalance, sBalance, cAmount, sAmount, cDepositButton, cWithdrawButton);
withdraw(sBalance, cBalance, sAmount, cAmount, sDepositButton, sWithdrawButton);
