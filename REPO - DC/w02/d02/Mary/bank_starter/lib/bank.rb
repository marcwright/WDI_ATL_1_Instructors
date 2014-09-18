class Bank
  def initialize(name_of_bank)
    @name = name_of_bank
    @accounts = []
  end

  def name
    return @name
  end

  def accounts
    return @accounts
  end

  def open_account(account_holder,deposit_amount)
    if deposit_amount >= 200
      @accounts.push({
        name: account_holder,
        balance: deposit_amount
      })
    else
      puts "You need more money than that to open an account!"
      return false
    end
  end

  def find_account(account_holder)
    @accounts.select do |account|
      account[:name] == account_holder
      return account
    end
  end

  def return_balance(account_holder)
    @accounts.select do |account|
      account[:name] == account_holder
      return account[:balance]
    end
  end

  def withdraw(account_holder, withdraw_amount)
      @accounts.select do |account|
        account[:name] == account_holder
        if account[:balance] >= withdraw_amount
          account[:balance] = account[:balance] - withdraw_amount
        else
          account[:balance] = account[:balance] - 30
        end
      end
  end

  def deposit(account_holder, deposit_amount)
    @accounts.select do |account|
      account[:name] == account_holder
      account[:balance] += deposit_amount
    end
  end


end
