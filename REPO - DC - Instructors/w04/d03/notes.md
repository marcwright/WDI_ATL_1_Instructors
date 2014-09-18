### Learning Objectives

* Explain what Ruby on Rails is and why it is so popular
* Explain what convention over configuration means and how it relates to Ruby on Rails
* Describe the lifecycle of an HTTP request in Ruby on Rails
* Follow Rails naming conventions when creating models, views and controllers
* Route requests to a controller action
* Render a view from a controller action
* Create a Rails App with CRUD actions (new, create, index, show, edit, update, destroy)

#### What is Rails?

- Because it is cool right? NO!
- Think critically about it

Student Research / Pair / Share
- What is it?
- What problem does it solve?
- How does it solve?
- Alternatives?
- Why is it so popular?

Read
- http://guides.rubyonrails.org/getting_started.html (Section 2)
- https://github.com/rails/rails

Discussion
- frameworks: common solutions for common problems
- highly opinionated, Rails is Omakase
- designed to enforce best practices (MVC, REST, TDD)
- teams! very efficient to get up to speed

CONVENTION over Configuration - minimize decisions developers have to make. Only things that are different need to be different!

- Enforced directory structure
- Assets & Asset Pipeline
- Testing framework built in
- ORM built in
- LOTS of other features
  - Gemfile
  - DB config
  - Testing
  - Environments
  - Rake Tasks

#### Framing

- There is going to be an absurd amount of stuff you don't know. That's okay
- Goal of the course is to get ok with not knowing
- A lot of new information today, next 2 days will be a lot more lab focused

#### What are we focusing on today?

* Start with just creating a simple CRUD app
* No big new features vs what we made w/ Sinatra, but getting the basics down first
* You will be making a lot of naming mistakes, just need to get used to the conventions
* Error messages are your friend! Read them

### How does Rails work?

- request/response cycle
  - [Diagram](http://f.cl.ly/items/081s3Y0D2y382s002y2l/rails.png)
  - Compare to Sinatra

- Separation of concerns
  - HTML, CSS, JavaScript
  - MVC

### The anatomy of a Rails project

- Website for Scooby Gang
- Focus on just CV this morning since routing and controllers are the newest/weirdest part

- directory structure
  - `rails new sample -d postgresql`

|File/ | Directory  Purpose
|:----- |:----- |
|app/ |   Core application (app) code, including models, views, controllers, and helpers
|app/ | assets  Applications assets such as cascading style sheets (CSS), JavaScript files, and images
|bin/ |   Binary executable files
|config/ |  Application configuration
|db/ |  Database files
|doc/ |   Documentation for the application
|lib/ |   Library modules
|lib/ | assets  Library assets such as cascading style sheets (CSS), JavaScript files, and images
|log/ |   Application log files
|public/ |  Data accessible to the public (e.g., web browsers), such as error pages
|bin/ | rails A program for generating code, opening console sessions, or starting a local server
|test/ |  Application tests (made obsolete by the spec/ directory in Section 3.1)
|tmp/ |   Temporary files
|vendor/ |  Third-party code such as plugins and gems
|vendor/ | assets Third-party assets such as cascading style sheets (CSS), JavaScript files, and images
|README.rdoc | A brief description of the application
|Rakefile | Utility tasks available via the rake command
|Gemfile | Gem requirements for this app
|Gemfile.lock |  A list of gems used to ensure that all copies of the app use the same gem versions
|config.ru | A configuration file for Rack middleware
|.gitignore | Patterns for files that should be ignored by Git

### Focus on
* app
* config/routes.rb
* db
* Gemfile

### Gems
* Gemfile
* Bundler / Bundle Install

### Rake
- What is Rake?
- Automate tasks
  - rake db:create
  - rake db:migrate

### Static Pages

First in depth:

- routes.rb
  - `rake routes`
  - WelcomeController (JUST AN EXAMPLE)
    - get '/shmee' => 'static#shmee'
    - root 'static#welcome'
  - Will do DB stuff in afternoon to illustrate

- Write a route for welcome
- Write the controller (dogs_controller.rb)
- DogsController < ApplicationController

```
class WelcomeController < ApplicationController
    def index
      render :index
    end
end
```

- Create the View
  - Create a Folder (dogs)
  - action.html.erb
  - Layouts.erb

- Create an About Page
- Create the Hire us Page
- Create an FAQ Page

# Afternoon - Creating a CRUD app

* Dog DB / Happitails Animal Shelter
* This morning we focused on the controller & view
* Create a Welcome Controller with a few static pages
* This afternoon we are going to add in the model

  - `rails new dog_db -d postgresql`

### Setting up our database
- database.yml
  - like our AR config
  - get rid of test and production

- rake db:create
  - check in psql
  - rails dbconsole

### What is a database migration?
- http://guides.rubyonrails.org/migrations.html (section 1, 2.1)

- database migrations
  - rake db:migrate

`rails generate migration CreateDogs`

```
class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name
      t.text :image_url
    end
  end
end

```

`rails generate migration AddAgeToDogs`

```
class AddAgeToDogs < ActiveRecord::Migration
  def change
    add_column :dogs, :age, :integer
  end
end

```

- rake db:rollback

- schema.rb
- seeds.rb
  - rake db:seed

- rails console
- Update gemfile with pry-rails
- bundle install

--- 
Break

---

- Setup a home and about page for our app

- Review RESTful Routes

- One model crud app
  - Index
  - New
  - Show
  - Create

- DogsController < ApplicationController
  - security
  - forms need authenticity tokens

- Route
- Controller
- View

- Strong params?

https://github.com/wdi-sf-march-2014/notes/blob/master/IntroToRails/rails_routing.md

---

Pair
- Create a 1 Model Rails app for an organization CYOA. Dunder Mifflin.