# Stephen Stanwood (stephen@stanwoodsolutions.com)

class Bank
  def initialize(name)
    @name = name
    @accounts = []
  end

  attr_reader :name, :accounts

  # Opens an account if provided with a balance of at least $200
  def open_account(name, amount)
    accounts.push({ :name => name, :balance => amount }) if amount >= 200
  end

  # Finds a bank account by name
  def find_account(name)
    return (accounts.select { |a| a[:name] == name }).first
  end

  # Returns the balance of a given account
  def return_balance(name)
    return find_account(name)[:balance]
  end

  # Allows a user to withdraw money
  def withdraw(name, amount)
    a = find_account(name)
    a[:balance] < amount ? a[:balance] -= 30 : a[:balance] -= amount
  end

  # Allows a user to deposit money
  def deposit(name, amount)
    find_account(name)[:balance] += amount
  end
end
