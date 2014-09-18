# HTML homework review | 9:00 - 9:45
- 


# Sinatra | 9:45 - 10:30
- Sinatra is a light-weight Ruby web framework
  - It handles serving pages for requests, but leaves pretty much everything else to us
  - http://www.sinatrarb.com
  
  gem install sinatra sinatra-contrib
    (https://github.com/sinatra/sinatra-contrib # some common extensions to Sinatra we might find useful)

- example from Sinatra website:

    require 'sinatra'
    get '/hi' do
      "Hello World!"
    end

    ruby hi.rb

- expand a little in the time remaining:

  require 'pry'
  require 'sinatra'
  require 'sinatra/reloader' if development

  get '/hi' do
    "Hello World!"
    binding.pry
  end

  # how to have just a homepage
  get '/' do
    'this is the homepage'
  end
  
  # capture parameters from the path
  get '/name/:first' do
    "your name is : #{params[:first]}"
  end
  
  # this could keep on going
  get '/name/:first/:last/:age' do
    "your name is #{params[:first]} #{params[:last]} and you are #{params[:age]} years old"
  end
  
  # html injection?
  
  # multiply two numbers and show the result
  get '/multiply/:x/:y' do
    result = params[:x].to_f * params[:y].to_f
    "the result is #{result}"
  end
  # where have we seen this before?...

# break | 10:30 - 10:45

# Sinatra, Calc demo app | 10:45 - 12:00
- setup app

  mkdir views

- create a view, and use it

  touch views/calc.rb

  # remove the render code, and change to an instance var
  get '/multiply/:x/:y' do
    @result = params[:x].to_f * params[:y].to_f
    erb :calc
  end

  # views/calc.rb
  the result is <%= @result %>

- what is this "ERB"?
  Embedded RuBy
  
  <% "evaluates the Ruby contained in the brackets, but doesn't do anything *with* it _in the view_" %>

  <%= "evaluates the Ruby contained in the brackets, and "puts" it in the view" %>
  
  <%# be careful with Ruby comments %>
  <% "don't be tempted to half-comment an expression" # like this; as the parser can get confused %>
  <% "it's best" %><%# to add another ERB block imediately afterwards to contain only the comments %>

- layouts (templates)
  - our ERB file needs all the HTML structure, and CSS files included
  - but *all* of our ERB files will need that... so we wanna be DRY
  
  touch views/layout.rb
  
  #layout
  <!doctype html>
  <html lang='en'>
    <head>
      <meta charset='utf-8'>
      <title>Calculator</title>
    </head>
    <body>
      <%= yield %>
    </body>
  </html>

- add CSS
  mkdir public
  touch public/style.css

  # layout
  <link rel='stylesheet' href='/style.css'>
  
  # CSS
  body {
    background-color: green;
  }

- Forms
  - Make the UI have form fields rather than editing the URL
  
  <form action='/calc' method='get'>
    <input type='text' name='first'>
    <input type='text' name='operator'>
    <input type='text' name='second'>
    <button>calculate!</button>
  </form>
  
  - Add a "/calc" handler
  
  get '/calc' do
    binding.pry
    erb :calc
  end
  # and interrogate params hash in pry
  
  get '/calc' do
    @first = params[:first].to_f
    @second = params[:second].to_f
    @operator = params[:operator]

    @result = case @operator
                when '+' then @first + @second
                when '-' then @first - @second
                when '*' then @first * @second
                when '/' then @first / @second
              end

    erb :calc
  end
  
  - update the view
  <% if @result %>
    <section>
      <header><h1>Result</h1></header>
      <div id='first'>the first number is <%= @first %></div>
      <div id='operator'>the operator is '<%= @operator %>'</div>
      <div id='second'>the second number is <%= @second %></div>
      <div id='result'><%= @result %></div>
    </section>
  <% end %>
  
  - ctrl-c to end Sinatra

# Lunch 	| 12:00 - 13:00

# Stock lab | 13:00 - 15:30
- Students should work individually on this assignment.

- Create a webpage.
- Add a header and footer.
- Add a field for symbol with a submit button.
- Then print out the stock symbol and the current price.
- Use the yahoofinance gem.
- You can include the normalize.css/reset.css files for your styling.

# break | 15:30 - 15:45

# Links Demo	 | 15:45 - 17:00
- The applications we have been writing are cool, but they are just one page. Let’s create an application that has links to multiple pages.

  touch main.rb
  mkdir public
  mkdir views
  cd public
  touch public/style.css
  touch views/layout.erb

Copy the layout and main.rb frame from previous.

- It could be worth copying this boiler-plate directory, because lots of our Sinatra apps will start off the same way


# Movies lab homework



