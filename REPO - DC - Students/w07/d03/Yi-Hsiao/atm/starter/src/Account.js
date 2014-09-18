function Account() {
  this.balance = 0;
}

Account.prototype.deposit = function( amount ) {
  this.balance += amount;

  return this;
};

Account.prototype.withdraw = function( amount ) {
  if ( amount <= this.balance ) {
    this.balance -= amount;

    return this;
  } else {
    return null;  // return null if insufficient funds
  }
};