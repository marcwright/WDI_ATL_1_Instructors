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

  def open_account(name, opening_deposit)
    if opening_deposit >= 200
      account = {
        name: name,
        balance: opening_deposit
      }
      @accounts.push(account)
    else
      return "You cannot create an account."
    end
  end

  def find_account(client_name)
    @accounts.find do |account|
      account[:name] == client_name
    end
  end

  def return_balance(client_name)
    account = find_account(client_name)
    return account[:balance]
  end

  def deposit(client_name, deposit_amount)
    account = find_account(client_name)
    account[:balance] = account[:balance] + deposit_amount
  end

  def withdraw(client_name, withdraw_amount)
    account = find_account(client_name)
    if account[:balance] > withdraw_amount
      account[:balance] = account[:balance] - withdraw_amount
    else
      account[:balance] -=30
    end
    return account[:balance]
  end

end
