var checkbal = document.getElementById('checking-balance');

var savbal = document.getElementById('savings-balance');

var checkamt = document.getElementById('checking-amount');
var savamt = document.getElementById('savings-amount');

var checkdepositbutton = document.querySelector('#checking-deposit');

var savdepositbutton = document.querySelector('#savings-deposit');

var checkwithdrawbutton = document.querySelector('#checking-withdraw');

var savwithdrawbutton = document.querySelector('#savings-withdraw');

checkdepositbutton.addEventListener('click', function() {
  var balance = parseInt(checkbal.textContent.split('$')[1]);
  balance += parseInt(checkamt.value);
  checkbal.textContent = '$' + balance.toString();
});

savdepositbutton.addEventListener('click', function() {
  var balance = parseInt(savbal.textContent.split('$')[1]);
  balance += parseInt(savamt.value);
  savbal.textContent = '$' + balance.toString();
});

checkwithdrawbutton.addEventListener('click', function() {
  var balance = parseInt(checkbal.textContent.split('$')[1]);
  var totalbalance = balance + parseInt(savbal.textContent.split('$')[1]);
  var withdraw = parseInt(checkamt.value);

  if (withdraw < balance) {
    balance -= withdraw;
    checkbal.textContent = '$' + balance.toString();
  } else if (withdraw < totalbalance) {
    withdraw -= balance;
    totalbalance -= balance + withdraw;
    checkbal.textContent = '$0';
    savbal.textContent = '$' + totalbalance.toString();
  }

});

savwithdrawbutton.addEventListener('click', function() {
  var balance = parseInt(savbal.textContent.split('$')[1]);
  var totalbalance = balance + parseInt(checkbal.textContent.split('$')[1]);
  var withdraw = parseInt(savamt.value);

  if (withdraw < balance) {
    balance -= withdraw;
    checkbal.textContent = '$' + balance.toString();
  } else if (withdraw < totalbalance) {
    withdraw -= balance;
    totalbalance -= balance + withdraw;
    savbal.textContent = '$0';
    checkbal.textContent = '$' + totalbalance.toString();
  }


});
