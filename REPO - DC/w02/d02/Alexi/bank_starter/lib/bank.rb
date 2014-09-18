class Bank

# Sets and gets name
  attr_accessor :name

  # Setter
  # def name(name)
  #   @name = name
  # end

  # Getter
  # def name
  #   return @name
  # end

  def initialize(name)
    @name = name
    @accounts = []
  end

# This redefines @accounts as a method. 
# The accounts method will be used throughout 
# the program.
# Getter -->
  def accounts
    return @accounts
  end

# This method accepts name and balance arguments
#. The
# 'accounts.push' syntax will push the given
# parameters into the accounts array as a
# hash.  
  def open_account(name, balance)
    if balance < 200.00
      puts "Insufficient funds"
    else
      accounts.push({name: name, balance: balance})
    end
  end

# This method again calls on the accounts
# method. It then performs '.find' on the array
# which is not only able to search through
# an array, but also reach inside hashes too.
# Accounts.find's work is dumped into a local
# variable, name_arg - name_arg acts as an hash.
# The method reaches into the hash, explicitly calling
# on the name hash (using a key) and determines (using boolean logic)
# whether it equals the parameter passed to the method's
# argument. The argument should automatically return name.
# 
# accounts.find is important, it gives the find_account method
# an important, reusable function - given a name parameter
# it iterates through the original @accounts array (by way
# of the accounts method) to generate a hash given one, and
# only one parameter: name. Even though this method returns
# only the name, it **finds** the entire hash which consists
# of the name and blance.
  def find_account(name)
    accounts.find do |name_arg|
      name_arg[:name] == name
      #auto return name
    end
  end

# This methods reuses the 'find_account' method to **find**
# a hash (name & balance), and dump into a new, local variable.
# This local variable (acct) is first checked for the existance
# of data, and if true, the balance is returned by reaching
# into the hash (by way of the local variable 'acct') and
# returning only the balance.
  def return_balance(name)
    acct = find_account(name)
    if acct
      return acct[:balance]
    end
  end

# # Cruft?
#   def account(account)
#     return @account
#   end

# The withdraw method can take arguments,
# name and a new parameter, amount. The method,
# however, immediately recyles the find_account
# method to isolate a hash, using a given name.
# Once the hash is "retrieved" and set to a new
# local variable, a boolean operation is performed
# to determine if the balance is greater than the 
# balance in the hash. If the boolean operation
# is true, then the desired withdrawal amount is
# subtracted from the original balance, and the
# remaining balance is placed back into the the hash
# and, by extension, back into the array. Then, the 
# new balance in the hash/array is placed into
# yet another variable and becomes the output
# of the method.

# The balance_before and balance_after variables
# appear to be optional - especially since they
# seem local.

  def withdraw(name, amount)
    user = find_account(name)
    if user[:balance] > amount
      user[:balance] -= amount
      return [:balance]
      # balance_after = user[:balance]
      # return balance_after
    else
      # balance_before = user[:balance]
      # balance_after  = (balance_before - 30)
      # user[:balance] = balance_after
      # return balance_after
      
# This else statement penalizes an overdraft.
      user[:balance] = user[:balance] - 30
      return user[:balance]

    end
  end

# Again, we recyle the find_account method and
# pass it the same 'name' parameter. This calls
# up a specific hash and assigns it to a new 
# local variable. 

# Again, I don't think I need all of the new
# variables. Perhaps when the final program
# is written, that will be important. But not for 
# testing!
  def deposit(name, deposit)
    user = find_account(name)
  # initial_balance = user[:balance]
    user[:balance] += deposit
  # balance_after = user[:balance]
  # return balance_after
  end
end

