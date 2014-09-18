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
    if amount >= 200
      accounts.push({name: name, balance: amount})
    end
  end

  def find_account(name)
    accounts.find do |h|
      h[:name] == name
    end
  end

  def return_balance(name)
    return find_account(name)[:balance]
  end

  def withdraw(name, withdrawal)
    if return_balance(name) >= withdrawal
      find_account(name)[:balance] -= withdrawal
    else
      find_account(name)[:balance] -= 30
    end
  end

  def deposit(name, dep_amount)
    return find_account(name)[:balance] += dep_amount
  end




end
