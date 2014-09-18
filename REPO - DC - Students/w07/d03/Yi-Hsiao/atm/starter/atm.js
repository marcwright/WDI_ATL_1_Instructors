(function() {
  // instantiate bank object with deposit/withdraw logic
  var bank = new Bank();

  // update the view after a deposit
  function updateDeposit() {
    // decide which account to deposit to
    var accountType = this.id == "checking-deposit" ? "checking" : "savings";
    
    // get the deposit amount from the input field and convert to Int
    var amountString = document.getElementById( accountType + "-amount" ).value;
    var amount = parseInt( amountString );

    // account is returned if deposit is successful
    var result = bank[accountType].deposit( amount );
    if ( result ) {
      var balanceView = document.getElementById( accountType + "-balance" );
      var balanceAmount = "$" + result.balance;

      updateBalance( balanceView, balanceAmount );
    }
  }

  // update the view after a withdrawal
  function updateWithdraw() {
    // find the primary account, i.e. which account the withdraw originated form
    var primaryAccount = this.id == "checking-withdraw" ? "checking" : "savings";
    var secondaryAccount = this.id == "checking-withdraw" ? "savings" : "checking";
    
    // get the withdrawal amount from the input field and convert to Int
    var amountString = document.getElementById( primaryAccount + "-amount" ).value;
    var amount = parseInt( amountString );

    // account is returned if deposit is successful
    var result = bank.withdraw( primaryAccount, amount );
    if ( result ) {
      // update both primary and secondary accounts
      var accounts = [primaryAccount, secondaryAccount];
      for ( var i = 0; i < accounts.length; i++ ) {
        var accountType = accounts[i];
        var balance = document.getElementById( accountType + "-balance" );
        var balanceAmount = "$" + result[accountType].balance;
        updateBalance( balance, balanceAmount );
      }
    }
  }

  // update balance in the webpage
  function updateBalance( balanceElement, amount ) {
    // update dollar amount in view
    balanceElement.textContent = amount;

    // add a zero class, if the balance is zero
    if ( amount == "$0" ) {
      balanceElement.classList.add( "zero" );
    } else {
      balanceElement.classList.remove( "zero" );
    }
  }

  // add event listeners
  document.getElementById("checking-deposit").addEventListener( "click", updateDeposit );
  document.getElementById("savings-deposit").addEventListener( "click", updateDeposit );
  document.getElementById("checking-withdraw").addEventListener( "click", updateWithdraw );
  document.getElementById("savings-withdraw").addEventListener( "click", updateWithdraw );
})();
