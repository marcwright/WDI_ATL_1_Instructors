#RSPEC in Rails: Part 3 - model spec method

In this section we will introduce how to write specs for the methods in your models.

We will start by reviewing validation specs.

In this app I'll demo how to do validations with only pure rspec (sorry thoughtbot) in~~~~ a Postgress backed app

No scaffolds this time ^_^

let's begin...

	rails _4.0.4_ new griffindor -T --database=postgresql
	
add rspec...

```
group :development, :test do
  gem 'rspec-rails'
end
```
Then the usual...

	bundle install
	
Get rspec set up to go
	
	rails g rspec:install

Open your .rspec

```
--color
--format documentation
--require spec_helper
```

Ok so let's generate a model...

	$ rails g model wizard first_name middle_name last_name house is_muggle:boolean
	
Open database.yml...

```
development:
  adapter: postgresql
  encoding: unicode
  database: wizzardtest_development
  pool: 5
  username: rails
  password:	rails
 
test:
  adapter: postgresql
  encoding: unicode
  database: wizzardtest_test
  pool: 5
  username: rails
  password: rails
```

###NOTE: remember that we created a postgres user "rails" last week

now create our database..

	rake db:create

	rake db:migrate RAILS_ENV=test
	

let's test our plumbing...see if rspec will run

	rspec spec

You should see 1 pending test

##Hooray you have a postgres backed rspec app with no scaffolding

let's build up some test now.

**wizards_spec.rb**
	
change this...

```
require 'rails_helper'

* RSpec.describe Wizard, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
```
#Model validation specs (non-thoughtbot)

into this...**pending**

```
xit 'is invalid without a first name'
xit 'is invalid without a last name'
xit 'is invalid without a house'
xit 'is invalid if is_muggle has not been set'
```
then to this...**one-at-a-time**

```
  it 'is invalid without a first name' do
    unnamed = Wizard.new(last_name: "Wizard", house: "Hufflepuff", is_muggle: false)
    expect(unnamed).to be_invalid
  end

  it 'is invalid without a last name' do
    unlastnamed = Wizard.new(first_name: "Anonymous", house: "Hufflepuff", is_muggle: false)
    expect(unlastnamed).to be_invalid
  end

  it 'is invalid without a house' do
    unsorted = Wizard.new(first_name: "Anonymous", last_name: "Wizard", is_muggle: false)
    expect(unsorted).to be_invalid
  end

  it 'is invalid if is_muggle has not been set' do
    squib = Wizard.new(first_name: "Anonymous", last_name: "Wizard", house: "Hufflepuff")
    expect(squib).to be_invalid
  end
```

#Model method specs

```
  describe "#full_name" do
  		it "returns the wizard's full name (first and last) as a string" do
  			harry = Wizard.new(first_name: "Harry", last_name: "Potter")
  			expect(harry.full_name).to eq "Harry Potter"
  		end
  		it "capitalizes the first and last names of wizards if they're entered in lowercase" do
  			fred = Wizard.new(first_name: "fred", last_name: "weasley")
  			expect(fred.full_name).to eq "Fred Weasley"
  		end
  end

  describe "#full_name_with_initial" do
  		it "returns the wizard's first name, middle initial, and last name (if the wizard has a middle name)" do
  			harry = Wizard.new(first_name: "Harry", last_name: "Potter", middle_name: "James")
  			expect(harry.full_name_with_initial).to eq "Harry J. Potter"
  		end

  		it "returns only the first and last name of a wizard who does not have a middle name" do
  			ron = Wizard.new(first_name: "Ron", last_name: "Weasley")
  			expect(ron.full_name_with_initial).to eq "Ron Weasley"
  		end

  		it "capitalizes names appropriately if entered in lowercase" do
  			voldemort = Wizard.new(first_name: "tom", middle_name: "marvolo", last_name: "riddle")
  			expect(voldemort.full_name_with_initial).to eq "Tom M. Riddle"
  		end
  end

  describe "#email" do
  		it "returns a wizard's email in the format of first_name@house.com" do
  			hermione = Wizard.new(first_name: "Hermione", house: "Gryffindor")
  			expect(hermione.email).to eq "hermione@gryffindor.com"
  		end

  		it "returns a muggle's email in the format of first_name@muggle.com" do
  			dudley = Wizard.new(first_name: "Dudley", is_muggle: true)
  			expect(dudley.email).to eq "dudley@muggle.com"
  		end
  end
```

##possible outcome

wizard.rb

```
class Wizard < ActiveRecord::Base
	validates_presence_of :first_name, :last_name, :house, :is_muggle

	def full_name
		first_name.capitalize + " " + last_name.capitalize
	end

	def full_name_with_initial
		if middle_name == nil 
			self.full_name
		else
			"#{first_name.capitalize} #{middle_name.first.capitalize}. #{last_name.capitalize}"
		end
	end

	def email
		if is_muggle == true
			"#{first_name.downcase}@muggle.com"
		else
			"#{first_name.downcase}@#{house.downcase}.com"
		end
	end
end
```

#main take away

1. how to build validations in pure ruby
2. do it with no scaffolds (they are wasteful)
3. review of building from scratch
4. model method spec creation