// Checking Account
function deposit() {
  var button = document.getElementById('checking-deposit');
  var checkingBalance = document.getElementById('checking-balance');
  var checkingAmount = document.getElementById('checking-amount');
  button.addEventListener('click', function(e){
    e.preventDefault();

    var checkingBalanceNumber = parseFloat(checkingBalance.textContent.substring(1));
    checkingBalanceNumber += parseFloat(checkingAmount.value);
    checkingBalance.textContent = '$' + checkingBalanceNumber.toFixed(2);
    checkingAmount.value = '';
    changeColorChecking();
  });
}
deposit();

function withdraw(amount) {
  var buttonWithdraw = document.getElementById('checking-withdraw');
  var checkingBalance = document.getElementById('checking-balance');

  var checkingAmount = document.getElementById('checking-amount');

  var savingsBalance = document.getElementById('savings-balance');

  buttonWithdraw.addEventListener('click', function(e){
    e.preventDefault();

    // Not sure why these two variables need to be within the event listener
    var checkingBalanceNumber = parseFloat(checkingBalance.textContent.substring(1));
    var savingsBalanceNumber = parseFloat(savingsBalance.textContent.substring(1));


    // if withdrawal amount <= checking balance
    if (checkingBalanceNumber >= checkingAmount.value) {
      checkingBalanceNumber -= parseFloat(checkingAmount.value);
      checkingBalance.textContent = '$' + checkingBalanceNumber.toFixed(2);
    // if withdrawal amount > checking balance, but < total balances
    } else if (checkingBalanceNumber + savingsBalanceNumber >= checkingAmount.value){
      var checkingAmountLeft = checkingAmount.value - checkingBalanceNumber;

      savingsBalanceNumber -= parseFloat(checkingAmountLeft);
      savingsBalance.textContent = '$' + savingsBalanceNumber.toFixed(2);
      checkingBalanceNumber = 0;
      checkingBalance.textContent = '$' + checkingBalanceNumber.toFixed(2)
    };

    checkingAmount.value = '';
    changeColorChecking();
    changeColorSavings();
  });
}
withdraw();

// Savings Account

function depositSavings() {
  var button = document.getElementById('savings-deposit');
  var savingsBalance = document.getElementById('savings-balance');
  var savingsAmount = document.getElementById('savings-amount');

  button.addEventListener('click', function(e){
    e.preventDefault();


    var savingsBalanceNumber = parseFloat(savingsBalance.textContent.substring(1));

    savingsBalanceNumber += parseFloat(savingsAmount.value);
    savingsBalance.textContent = '$' + savingsBalanceNumber.toFixed(2);
    savingsAmount.value = '';
    changeColorSavings();
  });
}
depositSavings();

function withdrawSavings(amount) {
  var buttonWithdraw = document.getElementById('savings-withdraw');
  var savingsBalance = document.getElementById('savings-balance');
  var savingsAmount = document.getElementById('savings-amount');

  var checkingBalance = document.getElementById('checking-balance');

  buttonWithdraw.addEventListener('click', function(e){
    e.preventDefault();

    // Not sure why these two variables need to be within the event listener
    var checkingBalanceNumber = parseFloat(checkingBalance.textContent.substring(1));

    var savingsBalanceNumber = parseFloat(savingsBalance.textContent.substring(1));
    if (savingsBalanceNumber >= savingsAmount.value) {
      savingsBalanceNumber -= parseFloat(savingsAmount.value);
      savingsBalance.textContent = '$' + savingsBalanceNumber.toFixed(2);
    // if withdrawal amount > checking balance, but < total balances
    } else if (checkingBalanceNumber + savingsBalanceNumber >= savingsAmount.value){
      var savingsAmountLeft = savingsAmount.value - savingsBalanceNumber;
      checkingBalanceNumber -= parseFloat(savingsAmountLeft);
      checkingBalance.textContent = '$' + checkingBalanceNumber.toFixed(2);
      savingsBalanceNumber = 0;
      savingsBalance.textContent = '$' + savingsBalanceNumber.toFixed(2)
    };

    savingsAmount.value = '';
    changeColorChecking();
    changeColorSavings();
  });
}
withdrawSavings();



// Change Colors

function changeColorChecking() {
  var checkingBalance = document.getElementById('checking-balance');
  var checkingBalanceNumber = parseFloat(checkingBalance.textContent.substring(1));
  if (checkingBalanceNumber === '' || checkingBalanceNumber === 0) {
    if (contains(checkingBalance.classList, 'zero') === false){
      checkingBalance.classList.toggle('zero');
    };
  } else {
    if (contains(checkingBalance.classList, 'zero') === true){
      checkingBalance.classList.toggle('zero');
    };
  }
}
changeColorChecking();


function changeColorSavings() {
  var savingsBalance = document.getElementById('savings-balance');
  var savingsBalanceNumber = parseFloat(savingsBalance.textContent.substring(1));
  if (savingsBalanceNumber === '' || savingsBalanceNumber === 0) {
    if (contains(savingsBalance.classList, 'zero') === false){
      savingsBalance.classList.toggle('zero');
    };
  } else {
    if (contains(savingsBalance.classList, 'zero') === true){
      savingsBalance.classList.toggle('zero');
    };
  }
}
changeColorSavings();

function contains(a, zero) {
    var i = a.length;
    while (i--) {
       if (a[i] === zero) {
           return true;
       }
    }
    return false;
}
