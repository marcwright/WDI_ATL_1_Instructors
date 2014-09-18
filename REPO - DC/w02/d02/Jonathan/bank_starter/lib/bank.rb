class Bank

  def initialize(name)
    @name = name
    @accounts = []
  end

  def name
    return @name
  end

  def accounts
    return @accounts
  end

  def find_account(name)
    accounts.find do |account|
      account[:name] == name
    end
  end

  def return_balance(name)
    acct = find_account(name)
      if acct
        return acct[:balance]
      end
  end

  def withdraw(name, withdraw)
    acct = find_account(name)
    balance_before = acct[:balance]
    balance_after = balance_before - withdraw
    acct[:balance] = balance_after
    return balance_after
  end


  def open_account(name, balance)
    account = {
      name: name,
      balance: balance
    }
    if account[:balance] >= 200
      @accounts.push(account)
    end
  end





end

