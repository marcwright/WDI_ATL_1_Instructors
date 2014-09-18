# Sinatra, Calc demo app

The point of this app is to put into practice the basics of using Sinatra, and introduce ERB and the general structure of Sinatra applications.

```
    mkdir views
    touch main.rb
```

```
    # main.rb
    require 'pry-byebug'
    require 'sinatra'
    require 'sinatra/reloader' if development?
```

create a view, and use it:

```
    touch views/calc.erb
```

Remove the render code, and change to an instance variable:

```
  get '/multiply/:x/:y' do
    @result = params[:x].to_f * params[:y].to_f
    erb :calc
  end
```

```
  # views/calc.erb
  the result is <%= @result %>
```

# What is this "ERB"?

Embedded RuBy

```
    <% "evaluates the Ruby contained in the brackets, but doesn't do anything *with* it _in the view_" %>
```

```
    <%= "evaluates the Ruby contained in the brackets, and 'puts' it in the view" %>
```

```
    <%# be careful with Ruby comments %>
    <% "don't be tempted to half-comment an expression" # like this; as the parser can get confused %>
    <% "it's best" %><%# to add another ERB block imediately afterwards to contain only the comments %>
```

# Layouts (templates)

Our ERB file needs all the HTML structure, and CSS files included.

But *all* of our ERB files will need that... so we wanna be DRY.
  
```
    touch views/layout.erb
```

```
    # views/layout.rb
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
```

Add CSS:

```
    mkdir public
    touch public/style.css
```

```
    # views/layout.rb
    <link rel='stylesheet' href='/style.css'>
```

```    
    # public/style.css
    body {
      background-color: green;
    }
```

# Forms

Make the UI have form fields rather than editing the URL

```
    <form action='/calc' method='get'>
      <input type='text' name='first'>
      <input type='text' name='operator'>
      <input type='text' name='second'>
      <button>calculate!</button>
    </form>
```

Add a "/calc" handler
  
```
    get '/calc' do
      binding.pry
      erb :calc
    end
    
    get '/calc' do
      # and interrogate params hash in pry
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
```

Update the view:

```
    <% if @result %>
      <section>
        <header><h1>Result</h1></header>
        <div id='first'>the first number is <%= @first %></div>
        <div id='operator'>the operator is '<%= @operator %>'</div>
        <div id='second'>the second number is <%= @second %></div>
        <div id='result'><%= @result %></div>
      </section>
    <% end %>
```

Ctrl-c to end Sinatra
