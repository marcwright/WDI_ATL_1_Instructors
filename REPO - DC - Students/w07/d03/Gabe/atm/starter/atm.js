//As a user, I want to deposit money into one of the bank accounts


//creata a savings acct...
  var savings = 0;

  //create a checking acct...
  var checking = 0;


function checkingAccount(Amount) {



  // 'find' the balance, amount(to add),...
  // deposit button and withdraw button...
  var balanceC = document.getElementById('checking-balance');
  var amountC = document.getElementById('checking-amount');
  var depositButton = document.getElementById('checking-deposit');
  var withdrawButton = document.getElementById('checking-withdraw');


//////   DEPOSIT FUNCTION

  //When deposit button is clicked...
 depositButton.addEventListener('click', function(){

  //find the amount to add from the amount window...
  var amountC = document.getElementById('checking-amount');

  //set the value of that element equal to a variable, for ease...
  var amountValue = amountC.value;

  //add the value from amountValue to the checking account variable...
  checking = amountValue +(checking);

  // set balance window equal to checking total...
  balanceC.textContent = checking;
 });

//As a user, I want to withdraw money from one of the bank accounts
/////  WITHDRAW FUNCTION

//When withdraw button is clicked...
 withdrawButton.addEventListener('click', function(){

  //find the amount to add from the amount window...
  var amountC = document.getElementById('checking-amount');

  //set the value of that element equal to a variable, for ease...
  var amountValue = amountC.value;

  //add the value from amountValue to the checking account variable...
  checking = checking - amountValue;

  // set balance window equal to checking total...
  balanceC.textContent = checking;
 });





}
checkingAccount();



//Make sure the balance in an account can't go negative. If a user tries to withdraw more money than exists in the account, ignore the transaction.


//As a user, I want overdraft protection


//What happens when the user wants to withdraw more money from the checking account than is in the account?


//If a withdrawal can be covered by the balances in both accounts, take the balance of the account withdrawn from down to $0 and take the rest of the withdrawal from the other account.


//If the withdrawal amount is more than the combined account balance, ignore it.


//As a user, I want the color of my back account to reflect it's balance (there's a CSS class called .zero already written for this!)
