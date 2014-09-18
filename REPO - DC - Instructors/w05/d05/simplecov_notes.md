##SimpleCov Notes

####Framing
SimpleCov is a code coverage analysis tool. It gives you a good idea of how much coverage your project has, and therefore how much of your code is protected and unprotected. 

The great thing about simplecov? It can be set up with just a couple lines of code.

####Setup

First, add simplecov to your gemfile. 

```ruby
# Tunr/Gemfile
gem 'simplecov', :group => :test
```
Second, add the following __to the very top__ of your `spec_helper` file.

```ruby
# Tunr/spec/spec_helper.rb
require 'simplecov'
SimpleCov.start
```
__Note:__ If SimpleCov starts after your application code is already loaded (via require), it won't be able to track your files and their coverage! The SimpleCov.start __must be issued__ before any of your application code is required! (ie: on the first two lines of your `spec_helper.rb` file)
___

Next, run your specs using the `rspec` command. This will actually give simplecov something to evaluate. Great, now `cd` into the coverage directory and open the `index.html` file. This will open up in Chrome show the coverage for the various componens of your rails app. Check out the various controllers. 

Finally, open up your gitignore and simply add the line 'coverage'






