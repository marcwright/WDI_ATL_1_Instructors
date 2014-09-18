#Background Jobs using Sidekiq
<br>

###Pull down our class repo and open up app in Sublime...

[https://github.com/ga-students/WDI_LA_7-8/tree/master/11-week/background_jobs](https://github.com/ga-students/WDI_LA_7-8/tree/master/11-week/background_jobs)

***Don't forget to copy it to a new location before editing!***
<br><br>

###Get this app up and running...

```
bundle install
bundle exec rake db:migrate
```
<br>

###Learning Objectives
* Explain *what* background jobs are, *why* you use them, and *how* to set up and use one.
* Be able to implement and execute a background job in an app.

<br>

### What we're doing in class today...
1. Introduce and talk about background jobs
2. Pull down repo and open up Kitty Mailer app
3. Sidekiq -- discuss and integrate
4. Redis -- discuss and install
5. Letter Opener -- add to our app

 

###How to Integrate Sidekiq and the Sidekiq Dashboard

**Add to your Gemfile:**

```
gem 'sidekiq'
gem 'sinatra', '>= 1.3.0', :require => nil

```

Don't forget to run ```bundle install``` !

**In your config/routes.rb add:**

```
require 'sidekiq/web'
mount Sidekiq::Web => '/sidekiq'

```
**Add this link_to to create a link to your Sidekiq Dashboard**

```
<%= link_to 'Monitoring', sidekiq_web_path %>
```

**Run the Sidekiq server:**

```
bundle exec sidekiq

```


**Resources:** <br> [http://sidekiq.org/](http://sidekiq.org/)
<br>[https://github.com/mperham/sidekiq/wiki/Monitoring](https://github.com/mperham/sidekiq/wiki/Monitoring)
<br>[http://blog.remarkablelabs.com/2013/01/using-sidekiq-to-send-emails-asynchronously](http://blog.remarkablelabs.com/2013/01/using-sidekiq-to-send-emails-asynchronously)
<br>[http://railscasts.com/episodes/366-sidekiq](http://railscasts.com/episodes/366-sidekiq)


<br><br>

###How to Integrate Redis

**Install Redis:** 

```
brew install redis
```
** Run the Redis server:**

```
redis-server
```

**Resources:**<br>
[http://redis.io/](http://redis.io/)
<br>


<br><br>
###Add Letter Opener to your App
**Add to your Gemfile:**

```
gem "letter_opener", :group => :development
```

**In your *config/environments/development.rb* add:**

```
config.action_mailer.delivery_method = :letter_opener

```
Don't forget to run ```bundle install``` !

**Resources:** <br>
[https://github.com/ryanb/letter_opener](https://github.com/ryanb/letter_opener)

<br>
<br>
<br>
