# Background jobs

We do a lot of stuff in our applications which can be considered expensive or slow. Sending emails, waiting for API responses and so on. These things do not necessarily need to be completed immediately; in some cases it is best to handle them asynchronously so that we can render the request for the client as quickly as possible.

Software like Resque or Sidekiq can help with this problem. They create a queue which waits for background jobs to enter, and then processes them sequentially, freeing up our web request/response cycle.

## Redis

An in-memory, key-value store, [Redis](http://redis.io/) is the most popular NoSQL database of its kind. Because it is volatile and stored in RAM, it is incredibly fast, since it does not need to write to disk. Redis can store strings, sets of strings, and hashes. Both Resque and Sidekiq, alongside lots of other software, use Redis as its datastore.

### Configuring Redis

First, brew it up:

    brew install redis

With Redis installed, we can spin up an instance any time we need on the command line, with the command redis-server. Brew also gives instructions to ensure that Redis is running every time our machine boots up, if you like.

## Sidekiq

One of the most popular gems for handling background, scheduled and recurring jobs is [Sidekiq](http://sidekiq.org/). In this example, we’re going to look at moving an ActiveMailer class out of the request/response cycle and into a Sidekiq queue.

Clone [the background-mailer repository](https://github.com/niceguyjames/wdi-w8d2-background-mailer), bundle install and rake the database.

### Letter opener

In this example, I’ve used Ryan Bate’s [letter_opener](https://github.com/ryanb/letter_opener) gem. This stops emails being sent in development, instead being rendered in the browser. Configuration is trivial:

Add gem 'letter_opener', :group => :development to the Gemfile, ensuring letter_opener is only being used in development. Then, add the following line to config/environments/development.rb:

    config.action_mailer.delivery_method = :letter_opener

This ensures that mails are intercepted by letter_opener and rendered by the web browser.

### Configuring Sidekiq

Add sidekiq to our Gemfile (gem 'sidekiq') and bundle install. Since Sidekiq is a binary, we also need to rehash our binaries with rbenv. Run rbenv rehash.

### Enabling the Sidekiq web interface

Sidekiq comes bundled with a nice web UI, showing you a history of all the jobs queued and processed by your application.

The interface has two dependencies, [slim](http://slim-lang.com/) (the HAML-esque templating language) and [Sinatra](http://www.sinatrarb.com/). Add the following to the Gemfile, then bundle install:

    gem 'slim', '>= 1.1.0'
    gem 'sinatra', '>= 1.3.0', :require => nil

The Sidekiq web UI is a Sinatra application that we can tell our Rails app to mount to a specific URL. Add the following to routes.rb:

    require 'sidekiq/web'
    mount Sidekiq::Web => '/sidekiq'

This will expose the Sidekiq web UI at [http://localhost:3000/sidekiq](http://localhost:3000/sidekiq) when we launch our server. This is a huge security risk in production, so please secure the route if you plan to deploy the application. More information is [available on the Sidekiq wiki](https://github.com/mperham/sidekiq/wiki/Monitoring).

### Launching Redis and the Sidekiq process

We can launch a new Redis instance with the command redis-server. Launch Sidekiq with bundle exec sidekiq. This will start Sidekiq watching Redis for new jobs to be processed. It does not launch the web interface, which is handled by our Rails application.

### Creating a worker class

Sidekiq has the concept of workers; we create a worker class, instantiate a new worker and add it to the queue. Sidekiq then processes the jobs in the queue.

At the moment, we have a callback method in our User class called send_welcome_email. This fires the welcome_email method on the UserMailer ActiveMailer class, which delivers an email to the user when their account has been created. Right now, this is all being handled in the request/response cycle; if the email server gets congested, it could negatively impact the performance of our application. Let’s fix that.

Workers are added to the app/workers folder. Let’s create a new file named user_email_worker.rb and put a new worker class in there.

    class UserEmailWorker
      include Sidekiq::Worker
      sidekiq_options retry: false
      def perform(email)
        UserMailer.welcome_email(email).deliver
      end
    end

This simply defines a new class called UserEmailWorker, mixing in the Sidekiq worker module. I’ve explicitly told Sidekiq not to retry the job if it fails (although this is bad practice). The class has one method, perform, which takes an argument. This is the method that gets run when the job is added to the queue. In this method, we’re sending the welcome email using ActiveMailer.

Importantly, we can only use simple datatypes with Sidekiq. From [the documentation](https://github.com/mperham/sidekiq/wiki/Best-Practices):

*"The arguments you pass to perform_async must be composed of simple JSON datatypes: string, integer, float, boolean, null, array and hash. The Sidekiq client API uses JSON.dump to send the data to Redis. The Sidekiq server pulls that JSON data from Redis and uses JSON.load to convert the data back into Ruby types to pass to your perform method. Don't pass symbols or complex Ruby objects (like Date or Time!) as those will not survive the dump/load round trip correctly."*

Now we need to refactor our User class. At the moment, it’s not adding a job to the queue, it’s just sending the email. Let’s replace the send_welcome_email method in the User class with the following:

    def send_welcome_email
      UserEmailWorker.perform_async(self.email)
    end

This will ensure that the job is added the queue and handled asynchronously, so our request/response cycle does not have to wait for the outcome of the welcome_email method.

### Jobs in the web UI

We can watch our jobs in the web UI when Rails is serving. Run rails s, then visit [http://localhost:3000/sidekiq](http://localhost:3000/sidekiq).

### Add a job to the queue

Now, whenever we create a user, the job will be added to the Sidekiq queue. Go to [http://localhost:3000/users/new](http://localhost:3000/users/new) and create a new user, then tab to the Sidekiq web UI and see the job added to the queue, then processed.

Since there are no other jobs in our queue, and the job can be processed so quickly, we can’t perceive any difference in performance. Go to the UserMailer class and add sleep 30 to the top of the welcome_email method. This ensures that the process will sleep for thirty seconds before attempting to send the email; in the request/response cycle, this would be unbelievably frustrating, but as a worker, the next page is rendered and thirty seconds later the new email will pop up in the browser.

### More Sidekiq

Sidekiq can do much, much more than this. We can define distinct queues and ensure jobs are added to their appropriate queue. We can give jobs their own priority, so they’ll be processed more quickly than others. We can create jobs as ‘scheduled’, so they are not performed as soon as possible, but at a specific time or date. Using a gem like [Sidetiq](https://github.com/tobiassvn/sidetiq), we can create ‘recurring’ jobs, which happen every *x*. This could be useful for web scraping.
