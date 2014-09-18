class Bank

  def initialize(bank_name)
    @bank_name = bank_name
    @accounts = []

  end

  def name
    return @bank_name
  end

  def accounts
    return @accounts
  end

  def open_account(name, balance)
    if balance >= 200
      @accounts.push(
        {
          name: name,
          balance: balance
        })
    else
      puts "Sorry, you're poor"
    end
  end

  def find_account(name)
    @accounts.find {|acct| acct[:name].include? name}
  end

  def return_balance(name)
    @accounts.select do |acct|
      acct[:name].include? name
      return acct[:balance]
    end
  end

  def withdraw(name, withdraw_amount)
    if withdraw_amount < return_balance(name)
      find_account(name)[:balance] = return_balance(name) - withdraw_amount
    else
      find_account(name)[:balance] = find_account(name)[:balance] - 30
    end

  end

  def deposit(name, deposit)
    find_account(name)[:balance] = return_balance(name)+ deposit.to_i
  end
end
