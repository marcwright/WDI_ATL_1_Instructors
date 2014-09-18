# Debugging Rails 

c. 45mins

  - logs

    - when you start a Rails server, it creates a log file for the environment it's running under

    - check the "Rails.root/log" folder

      cat log/development.log

      tail log/development.log

    - it's worth always having a terminal window open with this:
      tail -f log/development.log 

      you can clear the contents of the log file, and Rails will continue to write to it
      but don't delete it and create a new - if you do, you need to restart the Rails server


  - "better-errors" & Pry

    - We've had very good results using pry in the command line apps, and even with Sinatra.

    - We can use it the same way in Rails... or make it better

    - add to gemfile:

      group :development, :test do
        gem 'pry-rails'
        gem 'pry-byebug'
        gem 'pry-stack_explorer'
        gem 'binding_of_caller'
        gem 'better_errors'
      end

    - break your app...

      def home
        x = 10
        y = 100
        1/0
      end

      This gives us an 'immediates' window in our browser :-)

    - beware!! DO NOT LEAVE IN PRODUCTION

      `pwd`
      `ls > /home/michael/hax0rz.txt`

    - and you can still "binding.pry" like you have before

  - Rails panel
    - this is a Chrome extension that puts the Rails log file in our browser dev tools
      https://github.com/dejan/rails_panel

    - add to gemfile

    group :development do
      gem 'meta_request'
    end

    - install
      https://chrome.google.com/webstore/detail/railspanel/gjpfobpafnhjhbajcjgccbbdofdckggg
