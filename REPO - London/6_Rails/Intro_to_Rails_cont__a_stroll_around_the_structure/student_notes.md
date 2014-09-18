# Intro to Rails cont - a stroll around the structure

The Rails folder structure is (mostly) as follows:

my_rails_app/
..../app/
......../assets/
............/images/
............/javascripts/
............/stylesheets/
......../controllers/
......../helpers/
......../mailers/
......../models/
......../views/
............../layouts/
..../config/
......../environments/
......../initializers/
......../locales/
..../db/
......../migrate/
..../doc/
..../lib/
......../assets/
......../tasks/
..../log/
..../public/
..../script/
..../test/
......../fixtures/
......../functional/
......../integration/
......../performance/
......../unit/
............/helpers/
..../tmp/
......../cache/
............/assets/
............/sass/
......../pids/
......../sessions/
......../sockets/
..../vendor/
......../assets/
............/javascripts/
............/stylesheets/
......../plugins/
..../config.ru
..../Gemfile
..../README
..../Rakefile

Some of this never wants to go into git... so use a .gitignore
 

## Bundler

(http://bundler.io/)[http://bundler.io/]

Bundler is designed to maintain different environments based on the "gemfile". Bundler is also maintaining the dependencies of all the gems. 

We'll update our installed gems with `bundle` (or `bundle install`).


## Rake

(http://rake.rubyforge.org/)[http://rake.rubyforge.org/]

Rake is a task manager for Ruby.

Rake is useful for running tasks that change our application's behavior or are part of the application ("personal rake tasks"). We can see all the rake tasks by typing `rake -T`

Common Rake commands:

```
    rake routes
    rake db:create
    rake db:migrate
    rake db:migrate:down
    rake notes
    rake assets:precompile
```


## Rails generators

With "convention over configuration" in mind, we can use a lot of generators to produce common boilerplate code.

Typing `rails g` (or `rails generate`) will list the generators we have at our disposal:

```
    rails g controller
    rails g model
    rails g migration
    rails g scaffold
```

`rails g model` can also take arguments for fields types, and will create a migration too.

The same goes for `rails g controller`: 

```
    rails g controller NAME [action action] [options]
```

To illustrate this, let's create another rails app. 

In terminal, run: 

```
    rails new blog_app 
    cd blog_app 
    rails g scaffold Post title:string content:text
    rake db:migrate 
```

Let's look at it in Chrome:

```
    rails s 
```

Now let's expand it:

```
    rails g scaffold Author first_name:string last_name:string dob:date picture:string 
    rails g migration AddAuthorIdToPosts author_id:integer
```


## Rails console

Not unlike "psql", "irb" or "pry", there is a console in rails. We access it by typing:

```
    rails console 
```

or 

```
    rails c
```

And we can leave rails console by typing: 

```
    exit
```

Usually, we get into the console to manipulate models, check routes and debug the app.

We can use "pry-rails" to have the rails console with pry automatically interpreted. In order to do this, just add "pry-rails" to Gemfile in group development.

Let's look at some of this functionality and play with models in our rails console:

```
    author = Author.new 
    author.firstname = "Julien" 
    author.lastname = "Deslangles-Blanch"
```

