
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

  def open_account(account_holder, deposit)
    if deposit >= 200
       @accounts << {
        name: account_holder,
         balance: deposit
      }
    else
      puts "Larger deposit needed!"
    end
  end

   def find_account(account_holder)
     accounts.select do |account|
       account[:name] == account_holder
       return account
     end
   end

   def return_balance(account_holder)
    return find_account(account_holder)[:balance]
   end

   def withdraw(account_holder, withdrawal)
    if return_balance(account_holder) > withdrawal
    find_account(account_holder)[:balance] -= withdrawal
    else
    find_account(account_holder)[:balance] -= 30
    end
   end

   def deposit(account_holder, deposit)
    find_account(account_holder)[:balance] += deposit
  end
end
