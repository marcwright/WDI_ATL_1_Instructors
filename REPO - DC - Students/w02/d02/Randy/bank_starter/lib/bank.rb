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

	def open_account(account_holder, deposit)
		if deposit >= 200
			@accounts.push({name: account_holder, balance: deposit})
		end
	end

	def find_account(name)
		accounts.find{|hash| hash[:name] == name}
	end

	def return_balance(name)
		find_account(name)[:balance]
	end

	def withdraw(name, withdrawl)
		if return_balance(name) >= withdrawl
			find_account(name)[:balance] -= withdrawl
		else
				find_account(name)[:balance] -= 30
		end
	end

	def deposit(name, deposit)
		find_account(name)[:balance] += deposit
	end



end
