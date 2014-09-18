require 'pry'

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

# if user has an account, return account name
  def find_account(name)
    accounts.find do |account|
      account[:name] = name
    end
  end

# if user has an account, return the balance
  def return_balance(balance)
    acct = find_account(name)
    if acct
      return acct[:balance]
    end
  end





end
