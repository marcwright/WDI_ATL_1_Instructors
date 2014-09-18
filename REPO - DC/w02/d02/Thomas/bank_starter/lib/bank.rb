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

  def empty?
    return true
  end

  def open_account(name, balance)
    if balance.to_i >= 200
      accounts << {name: name, balance: balance}
    end
  end

  def find_account(name)
    accounts.find do |account|
      account[:name] == name
    end
  end

  def return_balance(name)
    user_account = find_account(name)
    if user_account
      return user_account[:balance]
    end
  end

  def withdraw(name, withdraw_amount)
    user_account = find_account(name)
    if user_account && user_account[:balance].to_i > withdraw_amount.to_i
      return user_account.replace({name: name, balance: (user_account[:balance] - withdraw_amount.to_i)})
    else
      return user_account.replace({name: name, balance: (user_account[:balance] - 30)})
    end
  end

  def deposit(name, deposit_amount)
    user_account = find_account(name)
    if user_account
      return user_account.replace({name: name, balance: (user_account[:balance] + deposit_amount.to_i)})
    end
  end



end
