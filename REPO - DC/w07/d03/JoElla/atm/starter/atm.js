var checkingTotal = 0,
  savingsTotal = 0,
  checkingEntry = document.getElementById('checking-amount'),
  savingsEntry = document.getElementById('savings-amount');


  document.getElementById('checking-deposit').addEventListener('click', function(){
    var deposit = parseFloat(checkingEntry.value);
    checkingTotal += deposit;
    document.getElementById('checking-balance').innerHTML = formatCurrency(checkingTotal);
      checkingEntry.value = '';
  });

  document.getElementById('savings-deposit').addEventListener('click', function(){
    var deposit = parseFloat(savingsEntry.value);
    savingsTotal += deposit;
    document.getElementById('savings-balance').innerHTML = formatCurrency(savingsTotal);
      checkingEntry.value = '';

  });



  document.getElementById('checking-withdraw').addEventListener('click', function(){
    var withdrawal = parseFloat(checkingEntry.value);
    if (checkingTotal > withdrawal){
    checkingTotal -= withdrawal;
    } else {
      savingsTotal -= withdrawal;
      document.getElementById('savings-balance').innerHTML = formatCurrency(savingsTotal);
    }
    document.getElementById('checking-balance').innerHTML = formatCurrency(checkingTotal);
      checkingEntry.value = '';
  });

  document.getElementById('savings-withdraw').addEventListener('click', function(){
    var withdrawal = parseFloat(savingsEntry.value);
    if (savingsTotal > withdrawal){
    savingsTotal -= withdrawal;}
    document.getElementById('savings-balance').innerHTML = formatCurrency(savingsTotal);
      checkingEntry.value = '';

  });



function formatCurrency(num){
  num = parseFloat(num);
  return '$' + num.toFixed(2);
}


  /////work zone
  function addMoney(id){
    document.getElementById(id).addEventListener('click', function(){
    var deposit = parseFloat(savingsEntry.value);

  }

    var savings = document.getElementById('savings-deposit');
    var checking = document.getElementById('checking-deposit');

    savingsTotal += deposit;
    document.getElementById('savings-balance').innerHTML = formatCurrency(savingsTotal);
      checkingEntry.value = '';

  });

   ////////
