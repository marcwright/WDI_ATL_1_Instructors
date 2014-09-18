# Test-Driven Bank

### Prompt:
You're going to open a bank. You know that opening a bank is serious business, so you've thoughtfully written out your expectations for the bank both in English (below) and in RSpec (in the `spec/bank_spec.rb` file).

Head into the `bank_starter` directory and run the `rspec` command. Rspec will run your tests, all of which will fail. It is your job to read the error and write the code to make the tests pass. You will write your code in the `lib/bank.rb` file.

__NOTE:__ You will be running into error after error. This is by design.

###Specifications for your Bank

* A bank has a name
* A bank can create an account when the opening deposit is 200.00 or higher
* A bank cannot create an account if the opening depost is less than 200.00
* A bank can find an account, provided it exists
* A bank can tell an account holder his/her balance
* A bank allows a withdrawal when the account has enough money
* A bank won't allow an overdraft, instead docking the account a $30 overdraft fee
* A bank allows users to take out money
