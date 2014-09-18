
class Bank
	def initialize(name)
		@name = name
		@accounts = []
	end

	# allow us to access name
	def name
		return @name
	end

	#allow us to access accounts
	def accounts
		return @accounts
	end

	def open_account(client_name, opening_balance)
		if opening_balance >= 200.00
			account = {name: client_name, balance: opening_balance}
			@accounts.push(account)
		else 
			return "The minimum balance for opening a new account is $200."
		end
	end


	def find_account(name_to_find)
		@accounts.find { |account| account[:name] == name_to_find } 
	end


	def return_balance(name_to_find_balance)
		account = find_account(name_to_find_balance) 
		account[:balance]
	end

	def deposit(name_of_account, amount)
		account = find_account(name_of_account)
		account[:balance] += amount
	end

	#def withdraw(name_of_account, amount)
	#	account = find_account(name_of_account)
	#	account[:balance] -= amount
	#end

	def withdraw(name_of_account, amount)
		account = find_account(name_of_account)
		balance_check = account[:balance] 
		if balance_check < amount
			account[:balance] -= 30
		else
			account[:balance] -= amount
		end
	end



end

