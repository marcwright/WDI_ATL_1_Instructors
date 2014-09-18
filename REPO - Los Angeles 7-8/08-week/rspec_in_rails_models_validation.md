#RSPEC in Rails: part 1 - model validations

Testing is a "religious" topic. You are going to hear all kinds of "that's wrong, do it this way" it's the usual. I'm going to share my personal philosophy....test everything. Test your models, Test your controller methods, Test your views.

Otherwise you will waste your time.

Today, We are going to build some model specs.

TODAYS critical take away is...

1. test if it exist.

2. test if it gives you the correct output.

3. keep your test readable!!! (you may bend DRY)

EVERY thing else is gravy. (In my humble opinion)

#Rap_Planet set up

rails _4.0.4_ new rap_planet -T

open your gemfile

add these items

```
group :development, :test do
  gem 'rspec-rails', '~> 3.0.0'
end

group :test do
  gem 'shoulda-matchers', require: false
end
```

Then the usual...

	bundle install
	
Get rspec set up to go
	
	rails g rspec:install
	
Add to rails_helper.rb: 

	require 'shoulda/matchers'
	
open .rspec

	remove --warnings
	
##Rappers and Songs

Now let's build a Rapper

	rails g scaffold Rapper name age:integer
	
Now let's build some songs

	rails g model Song title duration:integer rapper:references
	
##explore spec directories
Rails creates a test folder for you as soon as you create a Rails project using rails new application_name.

```
controllers/
helpers/        
models/        
requests/
routing/   
views/
```

The models directory is meant to hold tests for your models, the controllers directory is meant to hold tests for your controllers and the views directory is meant to hold tests that involve any views.

##Model spec

**open rapper_spec.rb ...**

```
RSpec.describe Rapper, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
```
change this to ...

```
RSpec.describe Rapper, :type => :model do
  before { @rapper = Rapper.create!(name: 'Alfonso R aka Jedi Master Kosh', age: 42) }
  subject { @rapper }

  it { should respond_to(:name) }
  it { should respond_to(:age) }
  it { should have_many(:songs) }
  it { should validate_numericality_of(:age).is_greater_than_or_equal_to(42) }
  it { should validate_presence_of(:name).with_message('cannot rap without a name!') }
end
```
	
Note what happens when you run 

	rspec spec
	
Now let's run rspec

	rspec spec/models



**open song_spec.rb ...**

```
RSpec.describe Song, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
```

change this to ...

```
before do
  @rapper = Rapper.create...?
  @song = Song.create....?
end
```


##Projects Lab

If time allows, have students create model specs for their projects and demo them!!!
	
###Cool sources

[http://guides.rubyonrails.org/v4.0.6/testing.html](http://http://guides.rubyonrails.org/v4.0.6/testing.html)

[https://github.com/thoughtbot/shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)

[https://www.relishapp.com/rspec](https://www.relishapp.com/rspec)


	


