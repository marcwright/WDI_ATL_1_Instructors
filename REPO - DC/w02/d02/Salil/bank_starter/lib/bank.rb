require "pry"

class Bank

  attr_accessor :name

  def initialize(name)
    @name = name
    @accounts = []
  end

  def accounts
    return @accounts
  end

  def empty?
  end

  def open_account(name, deposit)
    if deposit >= 200.0
      accounts.push({:name => name, :balance => deposit})
    else
      puts "You need more money fool"
    end
  end

  def last(name)
    return @accounts[name]

  end

  def find_account(name)
    account = []
    accounts.find do |acct|
      if name == acct[:name]
        account = acct
      else
        return false
      end
    end
    return account
  end

  def return_balance(name)
    balance = 0
    accounts.find do |acct|
      if name == acct[:name]
        balance = acct[:balance]
      else
        return false
      end
    end
    return balance
  end

  def withdraw(name, amount)
    balance = 0
    accounts.find do |acct|
      if name == acct[:name] && acct[:balance] >= amount
          acct[:balance] -= amount
          balance = acct[:balance]
      elsif name == acct[:name] && acct[:balance] < amount
          acct[:balance] -= 30
          balance = acct[:balance]
      else
        return false
      end
    end
    return balance
  end

  def deposit(name, deposit)
    balance = 0
    accounts.find do |acct|
      if name == acct[:name]
        acct[:balance] = acct[:balance] + deposit
        balance = acct[:balance]
      else
        return false
      end
    end
    return balance
  end
end

