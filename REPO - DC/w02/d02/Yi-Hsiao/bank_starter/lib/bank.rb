class Bank
  attr_reader :name, :accounts

  def initialize( name )
    @name = name
    @accounts = []
  end

  def open_account( holder, deposit )
    @accounts << { name: holder, balance: deposit } unless deposit < 200
  end

  def find_account( holder )
    @accounts.find { |account| account[:name] == holder }
  end

  def return_balance( holder )
    find_account( holder )[:balance]
  end

  def withdraw( holder, amount )
    curr_balance = return_balance( holder )
    find_account( holder )[:balance] -= (curr_balance >= amount ? amount : 30)
  end

  def deposit( holder, amount )
    find_account( holder )[:balance] += amount
  end

end
