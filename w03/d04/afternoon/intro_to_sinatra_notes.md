## Learning Objectives

### Concepts
- Describe what Sinatra is and what it is used for
- Describe the roles of WEBrick and Rack, and where they reside in the web app layer cake.
- Describe the lifecycle of a request in a simple Sinatra app
- Distinguish between a route and a path
  - a ROUTE is combination of a REQUEST TYPE and a PATH.
  - a PATH is '/say_hello'

### Mechanics

- Build a Sinatra app that responds to HTTP requests
- Define routes using Sinatra
- Define routes with URL paramters and access those parameters
- Redirect a request

## Intro to Sinatra

Sinatra is a DSL (Domain Specific Language) for building web applications in Ruby.

__Question:__ Does anyone one what Rails is?
  - Answer: Rails is a DSL Domain Specific Language) for building web applications. 
* Uses [WEBrick](http://www.ruby-doc.org/stdlib-2.0/libdoc/webrick/rdoc/WEBrick.html)
  - WEBrick is a very simple web server which comes bundled with the Ruby library. It's the default __development__ server for both Sinatra and Rails, allowing you to run a local server on your machine.
* Sinatra is built using [Rack middleware](http://rack.github.io) just like Rails
  - Rack middleware provides a simple, standardized interface (in Ruby) for interacting with the web server. It defines how to handle a request from the web.
* Occupies the same role as Rails. They're both web app frameworks, but..
    * Sinatra is a shovel where Rails is a nuclear powered backhoe.
    * Our goal is not to become Sinatra experts; using Sinatra as a stepping stone for Rails
      - Putting HTTP request knowledge into practice
      - Writing routes
* Sinatra has an extremely simple syntax that corresponds to what we've learned about the web
  - GET
  - POST
  - PUT
  - DELETE
* You can think of it like writing out conditionals. __IF__ a __GET__ request is made to this path, run the code within the block. __IF__ a __GET__ request is made to this other path, run the code within THAT block.

Review of networking from this morning - Client & Server, HTTP Request, Match route, Run Code, HTTP Response

#### Installing Sinatra

http://www.sinatrarb.com/intro.html

At your terminal: `gem install sinatra sinatra-contrib`

#### Saying "Hello, world!" in Sinatra

```ruby
# sinatra_app.rb
require 'sinatra'

get '/' do
  return 'Hello, wdi!'
end

get '/straight_ruby_homie' do
  fav_meme = "I like turtles"
  return "My favorite meme is, #{fav_meme}!"
end
```

#### Starting a Sinatra server
At your terminal: `ruby sinatra_app.rb`

`ctrl+c` to shut down server

Change something and refresh. No go. Why?
Dev environment?

`require 'sinatra/reloader'`


#### Accept a parameter

```ruby
# sinatra_greeter.rb
require 'sinatra'

get '/greet/:name' do
  "Hello, #{params[:name]}!"
end
```

#### Just normal Ruby code

```ruby
get "/greet/:name/:fav_food" do
  if params[:name] == "mary"
    "Hey #{params[:name]}, heard it's your birthday. Want some #{params[:fav_food]}?"
  else
    "What up, #{params[:name]}, let's eat some #{params[:sport]}"
  end
end
```

#### Mini-Lab Coin toss & RPS

GET request to /toss should return either "Heads" or "Tails" randomly.

GET request to /rps/rock should return either "Computer played scissor, you win!", "Computer played rock, you tie!" or "Computer played paper, you lose!"
Make this work for all scenarios.

#### Guest Book Sinatra - 

* Look at all the people who have signed the Guest Book - Index
* Look at one particular Guest Book Entry - Read
* Sign the Guest Book (Add an Entry) - Create

```Ruby
require 'sinatra'
require 'pry'

guest_book = {
  1 => "Jack Nicholson",
  2 => "Shelly Duvall",
  3 => "Danny Lloyd"
}

get "/guest_book" do
  guest_book.values.join(", ")
end

get "/guest_book/:id" do
  id = params[:id].to_i
  entry = guest_book[id]
  if entry
    entry
  else
    "There's no one who goes by that name here."
  end
end

post "/guest_book" do
  last_id = guest_book.keys.max
  guest_book[last_id + 1] = params[:name]
end

```
#### How do we make a post request?

- POSTman Intro

#### Assign Sinatra Calc with history
