function Bank() {
  this.checking = new Account();
  this.savings = new Account();
}

// withdraw funds from target account
// if insufficient funds, try to overdraft funds from other account
Bank.prototype.withdraw = function( account, amount ) {
  var newBalance = this[account].withdraw( amount );

  if ( newBalance === null ) {
    // if account balance is insufficient, check if there are enough funds in both accounts
    var totalBalance = this.checking.balance + this.savings.balance;
    if ( amount <= totalBalance ) {
      // identify the primary and secondary account
      // the primary account is the account where the withdraw originated from
      // the secondary account is the other account
      primaryAccount = account == "checking" ? this.checking : this.savings;
      secondaryAccount = account == "checking" ? this.savings : this.checking;

      primaryBalance = primaryAccount.balance;
      var remainder = amount - primaryBalance;

      primaryAccount.withdraw( primaryAccount.balance );
      secondaryAccount.withdraw( remainder );
    } else {
      return null; // return null if insufficient funds across all accounts
    }
  }

  return this;
};