
## Adding Sidekiq to our App

Redis is an open source, BSD licensed, advanced key-value store. It is often referred to as a data structure server since keys can contain strings, hashes, lists, sets and sorted sets.

    brew install redis
    git clone git@github.com:niceguyjames/wdi-w8d2-background-mailer.git

Now to check if you have it use:

    redis -server

then

    bundle 
    db:setup

Setup letter_opener
We will use a gem called letter_opener.
In your gemfile add:

    gem "letter_opener", :group => :development
    bundle

Now we can go into the development environment and add:

    config.action_mailer.delivery_method = :letter_opener



Add  the gem to gemfile:

    gem 'sidekiq'
    gem 'slim', '>=1.1.0'
    gem 'sinatra' '>= 3.1.0', :require => nil

Then `bundle`.

Now we can add a route for it:

    require 'sidekiq/web'
    mount Sidekiq::Web => '/sidekiq'

in the command line and create an instance of the redis server:

    redis -server

Now we will have both our rails server and our redis server running. 
`rbenv rehash` if you are on rbenv...

Now run:

    bundle exec sidekiq

Now we can create a new workers folder, in the app directory:

    mkdir app/workers

Now we want to define a new worker. In the worker directory make a new file called:

    user_email_worker.rb

    class UserEmailWorker
      include Sidekiq::Worker
      sidekiq_options retry: false

      def perform(email)
        UserMailer.welcome_email(email).deliver
      end
    end

Now we will need to refactor our user class to use this worker:

    def send_welcome_email
      UserEmailWorker.perform_async(self.email)
    end

