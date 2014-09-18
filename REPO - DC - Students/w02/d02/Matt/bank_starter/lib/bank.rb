require "pry"
# require_relative ""

# def get_answer_to(question)
#   puts question
#   answer = gets.chomp
# end

class Bank

  #initialize
  def initialize(name)
    @name = name
    @accounts = []
    # @bank = bank
  end

  #getters
  def name
    return @name
  end

  def accounts
    return @accounts
  end

  def account
    return @account
  end

  #create account and check for sufficient funds
  def open_account(name, balance)
    account = {name: name, balance: balance}
    if account[:balance] >= 200
      @accounts.push(account)
    else
    end
  end

  #find account
  def find_account(name)
    accounts.find do |account|
      account[:name] = name
    end
  end

  #return account balance
  def return_balance(balance)
    acct = find_account(name)
    if acct
      return acct[:balance]
    end
  end

  #withdraw funds
  def withdraw(name, amount)
    account = []
    accounts.find do |acct|
      if name = acct[:name] && acct[:balance] >= 230
        acct[:balance] = acct[:balance] - amount
        account = acct[:balance]
      elsif name = acct[:name] && acct[:balance] <= 229
        acct[:balance] = acct[:balance] - 30
        return
      else
        return false
      end
    end
  end


  #deposit funds
  def deposit(name, amount)
    account = []
    accounts.find do |acct|
      if name = acct[:name]
        acct[:balance] = acct[:balance] + amount
        account = acct[:balance]
      else
        return false
      end
    end
  end
# binding.pry
end
