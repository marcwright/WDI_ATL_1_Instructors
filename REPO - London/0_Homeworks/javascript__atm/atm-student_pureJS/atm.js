var checkingBalance = 0;
var savingsBalance = 0;

window.onload = function(){

  // Add deposit functionality to checking
  document.getElementById("checkingDeposit").onclick = function(event){
    var amount = document.getElementById("checkingAmount").value;
    amount = parseInt(amount);
    checkingBalance = amount + checkingBalance;
    updateDisplay();
  };

  // Add deposit functionality to savings
  document.getElementById("savingsDeposit").onclick = function(event){
    var amount = document.getElementById("savingsAmount").value;
    amount = parseInt(amount);
    savingsBalance = amount + savingsBalance;
    updateDisplay();
  };

  document.getElementById("checkingWithdraw").onclick = function(event){
    var amount = document.getElementById("checkingAmount").value;
    amount = parseInt(amount);
    balances = withdrawFunds(amount, checkingBalance, savingsBalance);
    checkingBalance = balances[0];
    savingsBalance = balances[1];
    updateDisplay();
  };

  document.getElementById("savingsWithdraw").onclick = function(event){
    var amount = document.getElementById("savingsAmount").value;
    amount = parseInt(amount);
    balances = withdrawFunds(amount, savingsBalance, checkingBalance);
    savingsBalance = balances[0];
    checkingBalance = balances[1];
    updateDisplay();
  };

  updateDisplay();
};

function withdrawFunds(amount, primary, secondary)
{
  if(amount <= primary)
  {
    primary = primary - amount;
  }
  else if((amount > primary) && (amount <= (secondary + primary)))
  {
    secondary = (primary + secondary) - amount;
    primary = 0;
  }
  return [primary, secondary];
}

function updateDisplay()
{
  var element = document.getElementById("checkingBalance");
  if(checkingBalance <= 0)
    element.classList.add("zero");
  else
    element.classList.remove("zero");

  var element2 = document.getElementById("savingsBalance");
  if(savingsBalance <= 0)
    element2.classList.add("zero");
  else
    element2.classList.remove("zero");

  document.getElementById("checkingBalance").innerHTML = "$" + checkingBalance;
  document.getElementById("savingsBalance").innerHTML = "$" + savingsBalance;
  document.getElementById("checkingAmount").value = "";
  document.getElementById("savingsAmount").value = "";
}
