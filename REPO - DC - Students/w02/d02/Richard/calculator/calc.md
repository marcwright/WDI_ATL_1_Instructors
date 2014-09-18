#Rspec Calculator

##Prompt

We're going to write another calculator in order to get more comfortable with the RSpec syntax.

####Step 1

Run RSpec. You should see a list of all of the failed and pending tests.

####Step 2

I've written the first few tests for the add and subtract methods. Read through those tests and make them pass.

####Step 3

I've written stubs for the power, sum, multiply, and factorial methods. When you look at the `calc_spec.rb` file you'll see a bunch of "it" statements that aren't being passed a block. Also, when you run rspec they will show up in yellow.

Find those stubs and fill them out by writing the tests. Once you have written the tests and can see that they are failing (red), make them pass.

####Step 4 - Reading and revisiting

1. [What is that "#" that we put before each method for?](http://betterspecs.org/#describe)
2. What else can we test for besides equality?
    * [Expectations in RSpec](https://www.relishapp.com/rspec/rspec-expectations/v/2-14/docs)
    * [Built in matchers with Rspec:](https://www.relishapp.com/rspec/rspec-expectations/v/2-14/docs/built-in-matchers)

####Bonus

Write tests for a [GCD method](http://en.wikipedia.org/wiki/Greatest_common_divisor). Then write the code to make them pass.