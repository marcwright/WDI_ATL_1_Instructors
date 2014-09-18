var chAmount = document.querySelector('#checking-amount');
var chDeposit = document.querySelector('#checking-deposit');
var chWithdraw = document.querySelector('#checking-withdraw');
var chDisplay = document.querySelector('#checking-balance');
var chBalance = 0;

var sAmount = document.querySelector('#savings-amount');
var sDeposit = document.querySelector('#savings-deposit');
var sWithdraw = document.querySelector('#savings-withdraw');
var sDisplay = document.querySelector('#savings-balance');
var sBalance = 0;

chDeposit.addEventListener('click', function() {
  var money = parseInt(chAmount.value);
  chBalance = chBalance + money;
  chDisplay.textContent = '$' + chBalance.toString();
});

chWithdraw.addEventListener('click', function() {
  var money = parseInt(chAmount.value);
  if (money > chBalance && money <= sBalance ) {
      money = money - chBalance;
      sBalance = sBalance - money;
      chBalance = 0;
      sDisplay.textContent = '$' + sBalance.toString();
    }
    else if (money > chBalance) {
      chBalance = chBalance;
    }
  else {
    chBalance = chBalance - money;
  }
  chDisplay.textContent = '$' + chBalance.toString();
});

sDeposit.addEventListener('click', function() {
  var money = parseInt(sAmount.value);
  sBalance = sBalance + money;
  sDisplay.textContent = '$' + sBalance.toString();
});

sWithdraw.addEventListener('click', function() {
  var money = parseInt(sAmount.value);
  if (money > sBalance) {
    sBalance = sBalance;
  }
  else {
    sBalance = sBalance - money;
  }
  sDisplay.textContent = '$' + sBalance.toString();
});
