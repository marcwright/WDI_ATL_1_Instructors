##Multi-model CRUD, Advanced Routing

####Intro
Yesterday we built a one model CRUD app. This morning, we're going to build it out into a multi-model app by combining some new Rails tools with some tools from ActiveRecord that we're already familiar with. What are we going to do? We're going to give our dogs toys.

####But first, let's clean up our routes file
```ruby
  #routes.rb
  get '/about' => 'welcome#about'
  get '/dogs' => 'dogs#index'
  get '/dogs/new' => 'dogs#new'
  post '/dogs' => 'dogs#create'
  get '/dogs/:id' => 'dogs#show'
```
__It's messy. How do we clean it up?__

####Research and Report - Resource Routing
Take 15 minutes to read Sections 2.0 - 2.4 (CRUD, Verbs, and Actions) and this stack overflow post by yourself. 
- Questions
  - What is resource routing?
  - What problem does it solve?

- Now take 5 minutes to discuss these questions with a neighbor.

- What did you find?

__Great, now how do we implement it?__

`resources :dogs` 

__Let's examine the output__

`rake routes`

__Great, but we have more routes than we actually need. How do we customize it?__

`resources :dogs, { :except => [:new, :index, :show] }`

####Multi-Model Crud (Pets have toys)
Entity Relationship Diagram
  - Pet has 0 or many Toy

__First, we have to write a class__

```ruby
# app/models/toy.rb
class Toy < ActiveRecord::Base

end
```

__But how do we tell active record that a toy belongs to a particular dog?__

```ruby
belongs_to :dog
```

__But this isn't enough. We need to declare the other half of the relationship.__

```ruby
class Dog < ActiveRecord::Base
  has_many :pets, { :dependent => :destroy }
end
```

__What does the model do? It talks to the database. But can we talk to the database yet? (Can we create a toy without a database table?)__

`rails g migration CreateToys`

```ruby
class CreateToys < ActiveRecord::Migration
  def change
    create_table :toys do |t|
      t.string :name
      t.string :photo_url
      t.references :dog
      t.timestamps
    end
  end
end
```

__We've prepared our migration file, but now we need to migrate it__

`rake db:migrate`

__And voila--everything should be set up. Now let's make sure our relationships are working within the rails console.__

`rails console`

```ruby
Toy.create(name: "Buzz Lightyear", photo_url: "http://upload.wikimedia.org/wikipedia/en/7/75/Buzz-lightyear-toy-story-3-wallpaper.jpg", dog_id: 3)

buzz_lightyear = Toy.last
buzz_lightyear.dog  # => "Frank"
dog3 = Dog.find(3)
dog3.toys.last # =>
```

__Okay, great, now what routes do we need to manage a particular dog's toys?__
```ruby
# to see all of a dogs toys
get '/dogs/:dog_id/toys' => "toys#index"
# to create a new toy that belongs to a particular dog
post '/dogs/:dog_id/toys' => "toys#create"
# to get to the form for creating a new toy for a dog
get '/dogs/:dog_id/toys/new' => "toys#show"
```

__Deja Vu!!!__

####Think/Pair/Share - Nested Resources
- Take 10 minutes to read section 2.7 of the Rails Routing Guide:

- Questions
  - What are nested resources?
  - What problem does resource nesting solve?

- Take 5 minutes to discuss these questions with a neighbor.

- What did you find?

__Great, now how do we implement them in the context of dogs and toys?__

```ruby
  resources :dogs do
    resources :toys
  end
```
__Let's take a look at the routes we have at our disposal__

`rake routes`

__Let's visit "http://localhost:3000/dogs/3/toys"__

...Okay, so now we have to create a `toys_controller.rb` file

```ruby
class ToysController < ApplicationController

end
```

####Error-Driven Development
Try the URL and follow the errors

1. Create an index action
2. Create a template for the action
  - make a directory, 'toys', within views
  - within 'toys', create an `index.html.erb` file

```ruby
  # toys_controller.rb
  def index
    @toys = Toy.where(dog_id: params[:dog_id])
  end
```

__Okay, so typically our index action shows off all the entries from a table__

```erb
<% @toys.each do |toy| %>
  <li><a href="/dogs/<%= toy.dog_id %>/toys/<%= toy.id %>"><%= toy.name %></a></li>
<% end %>
```

__Great, that seems to work, but we'll have to create a controller action and corresponding view__

```ruby
  # toys_controller.rb
  def show
    @toy = Toy.find(params[:id])
  end
```

```ruby
# show.html.erb
<p><%= @toy.name %></p>
<img src="<%= @toy.photo_url %>" alt="">
```

__What about the edit view?__

```erb
<form action="/dogs/<%= params[:dog_id] %>/toys" method="post">
  <input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>">
  <label for="toy-name">New Toy's Name:</label>
  <input id="toy-name" type="text" name="name">

  <label for="photo">Photo URL:</label>
  <input id="photo" type="text" name="photo_url">

  <input type="submit" value="Create Toy">
</form>
```

__and the form handler at toys#create...__

```ruby
  # toys_controller.rb
  def create
    @toy = Toy.create(name: params[:name], photo_url: params[:photo_url], dog_id: params[:dog_id])
    redirect_to("/dogs/#{params[:dog_id]}/toys/#{@toy.id}")
  end
```










