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

  def open_account(name, amount)
    if amount >= 200.00
      accounts.push({name: name, balance: amount})
    end
  end

  def find_account(name)
    acct = accounts.find do |h|
      h[:name] == name
    end
    return acct
  end

  def return_balance(name)
    return find_account(name)[:balance]
  end

  def withdraw(name, amount)
    if return_balance(name) - amount < 0
      find_account(name)[:balance] -= 30.00
    else
      find_account(name)[:balance] -= amount
    end
  end

  def deposit(name, amount)
    find_account(name)[:balance] += amount
  end

end
