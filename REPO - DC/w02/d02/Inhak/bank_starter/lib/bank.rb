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

  def open_account(name, balance)
    if balance >= 200
      @accounts.push({name: name, balance: balance.to_f})
    else
      return "Not enough money to start an account."
    end
  end

  def find_account(name)
    return @accounts.find { |account| account[:name] == name }
  end

  def return_balance(name)
    user_hash = @accounts.find { |account| account[:name] == name}
    return user_hash[:balance]
  end

  def withdraw(name, amount)
    if return_balance(name) < amount
      puts "ERROR: NOT ENOUGH FUNDS"
      return find_account(name)[:balance] = return_balance(name) - 30.00
    else
      find_account(name)[:balance] = return_balance(name) - amount
    end
  end

  def deposit(name, amount)
    return find_account(name)[:balance] = return_balance(name) + amount
  end

end

