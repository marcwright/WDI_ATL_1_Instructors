#BDD Capybara Lesson
BDDoge in week 10 folder

##Instructor-DOES
(switch to selenium branch...if time allows show phantom on master)

OBJECTIVES

1. Describe the difference between a unit test and an acceptance/integration test
2. Be able to design acceptance tests based on Pivotal Stories
3. Write acceptance tests using Capybara

##Defined - unit test

	In computer programming, unit testing is a software testing method by which individual units of source code are tested to determine if they are fit for use. In a rails app this will probably be on an individual method basis.


##Defined - acceptance test

	In software engineering acceptance testing is a test conducted to determine if the requirements of a specification or contract are met. It involves, physical tests, or performance tests.

Acceptance tests- you can turn the spec for a feature into a test

Pivotal Tracker - [https://www.pivotaltracker.com/n/projects/1099738](https://www.pivotaltracker.com/n/projects/1099738)


rake db:create db:migrate

rake db:test:prepare

RAILS_ENV=test bundle exec rake db:migrate

rails g controller welcome index

DELETE helpers and views folders

rails g controller doges index show new create

DELETE helpers and views folders and doges controller spec

$ bundle exec rspec spec

should have 3 examples and no failures

TDD- unit testing

BDD- more for client, acceptance testing

##We-DO

students clone down the code and get it going
	
rake db:create db:migrate

rake db:test:prepare

RAILS_ENV=test bundle exec rake db:migrate

rails g controller welcome index

DELETE helpers and views folders

rails g controller doges index show new create

DELETE helpers and views folders and doges controller spec

$ bundle exec rspec spec

should have 3 examples and no failures

##Students-DO

NOTES:

####PhantomJS version:

**install phantomjs**

$ brew update && brew install phantomjs

then in your gemfile

	group :development, :test do
	  gem "rspec-rails", '< 3.0.0'
	  gem "capybara"
	  gem "database_cleaner"
	  gem "poltergeist"
	end

####Selenium version

**install selenium-webdriver**

place this in gem file

	group :development, :test do
  		gem "rspec-rails", '< 3.0.0'
  		gem 'selenium-webdriver', '~> 2.43.0'
  		gem "capybara"
  		gem "database_cleaner"
	end

may need this as well on the cli

	$ gem update selenium-webdriver

<br>
###Students test a login procedure....

Students can use a stock "control" app and then, using the link below, develop a feature test for signup.

[Using_Capybara_with_RSpec](http://rubydoc.info/github/jnicklas/capybara#Using_Capybara_with_RSpec)

<br>

#useful links
[http://phantomjs.org/quick-start.html](http://phantomjs.org/quick-start.html)

[http://www.seleniumhq.org/](http://www.seleniumhq.org/)

[http://martinfowler.com/bliki/UnitTest.html](http://martinfowler.com/bliki/UnitTest.html)

[http://devblog.avdi.org/2012/08/31/configuring-database_cleaner-with-rails-rspec-capybara-and-selenium/](http://devblog.avdi.org/2012/08/31/configuring-database_cleaner-with-rails-rspec-capybara-and-selenium/)

[Railscast 257](http://railscasts.com/episodes?utf8=%E2%9C%93&search=257)