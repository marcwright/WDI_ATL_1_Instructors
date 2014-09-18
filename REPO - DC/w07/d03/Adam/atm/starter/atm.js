// Bank Account

function Account(amount){
  this.amount = amount;
}

Account.prototype = {
  addMoney: function(money) {
    this.money += money;
  }

  subMoney: function(money) {
    this.money -= money;
  }


};

// End Bank Account
