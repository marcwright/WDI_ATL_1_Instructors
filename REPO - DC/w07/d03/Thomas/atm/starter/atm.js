var checkingBalance = document.getElementById('checking-balance');
var savingsBalance = document.getElementById('savings-balance');


//As a user, I want to deposit money into one of the bank accounts
function depositChecking() {
  var checkingDepositButton = document.getElementById('checking-deposit');
  checkingDepositButton.addEventListener('click', function() {
    //why does the 0 int shift when I withdraw 0.  how else can i prevent NaN?
    var checkingDepositAmount = document.getElementById('checking-amount').value || 0;
    checkingBalance.innerHTML = parseInt(checkingBalance.innerHTML.replace('$', '')) + parseInt(checkingDepositAmount);
    checkingBalance.innerHTML = '$ ' + checkingBalance.innerHTML;
    document.getElementById('checking-amount').value = '';
  });
}
depositChecking();

function depositSavings() {
    var savingsDepositButton = document.getElementById('savings-deposit');
    savingsDepositButton.addEventListener('click', function() {
      var savingsDepositAmount = document.getElementById('savings-amount').value || 0;
      savingsBalance.innerHTML = parseInt(savingsBalance.innerHTML.replace('$', '')) + parseInt(savingsDepositAmount);
      savingsBalance.innerHTML = '$ ' + savingsBalance.innerHTML;
      document.getElementById('savings-amount').value = '';
    });
}
depositSavings();

//As a user, I want to withdraw money from one of the bank accounts
//the below are set up in two different manners, which one is perferrable?
function withdrawChecking() {
  var checkingWithdrawButton = document.getElementById('checking-withdraw');
  checkingWithdrawButton.addEventListener('click', function() {
    //why does the below || 0 add a space between the dollar sign?
    var checkingWithdrawAmount = document.getElementById('checking-amount').value || 0;
    if ((parseInt(checkingBalance.innerHTML.replace('$', ''))) < (parseInt(checkingWithdrawAmount))) {
      document.getElementById('checking-amount').value = '';
      return
    }
    checkingBalance.innerHTML = parseInt(checkingBalance.innerHTML.replace('$', '')) - parseInt(checkingWithdrawAmount);
    checkingBalance.innerHTML = '$ ' + checkingBalance.innerHTML;
    document.getElementById('checking-amount').value = '';
  });
}
withdrawChecking();

function withdrawSavings() {
  var savingsWithdrawButton = document.getElementById('savings-withdraw');
  savingsWithdrawButton.addEventListener('click', function() {
    var savingsWithdrawAmount = document.getElementById('savings-amount').value
    if ((parseInt(savingsBalance.innerHTML.replace('$', ''))) < (parseInt(savingsWithdrawAmount)) && (parseInt(checkingBalance.innerHTML.replace('$', ''))) + (parseInt(savingsBalance.innerHTML.replace('$', ''))) > (parseInt(savingsWithdrawAmount))) {
      checkingBalance.innerHTML = '$' + ((parseInt(checkingBalance.innerHTML.replace('$', ''))) - ((parseInt(savingsWithdrawAmount)) - (parseInt(savingsBalance.innerHTML.replace('$', '')))))
      savingsBalance.innerHTML = '$' + 0;
      document.getElementById('savings-amount').value = '';
    } else if ((parseInt(savingsBalance.innerHTML.replace('$', ''))) >= (parseInt(savingsWithdrawAmount))) {
      savingsBalance.innerHTML = parseInt(savingsBalance.innerHTML.replace('$', '')) - parseInt(savingsWithdrawAmount);
      savingsBalance.innerHTML = '$ ' + savingsBalance.innerHTML;
      document.getElementById('savings-amount').value = '';
    } else {
      document.getElementById('savings-amount').value = '';
    }
  });
}
withdrawSavings();


