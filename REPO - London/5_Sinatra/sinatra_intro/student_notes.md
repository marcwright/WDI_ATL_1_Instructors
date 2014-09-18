# Sinatra

Sinatra is a light-weight Ruby web framework

  - It handles serving pages for requests, but leaves pretty much everything else to us
  - http://www.sinatrarb.com

```
    gem install sinatra sinatra-contrib
```

(https://github.com/sinatra/sinatra-contrib # some common extensions to Sinatra we might find useful)

## Example from Sinatra website:
    
```
    # hi.rb
    require 'sinatra'
    get '/hi' do
      "Hello World!"
    end

    ruby hi.rb
```

## Expand the functionality of the app

```
    require 'pry-byebug'
    require 'sinatra'
    require 'sinatra/reloader' if development?

    get '/hi' do
      "Hello World!"
      binding.pry
    end
```

We can use pry as we did in our command-line apps - be aware of the fact that the debugger will appear in the terminal console window, not in the browser.

Also, if you use any `puts` or `print` calls, their output will appear on the terminal console, not in the browser.

```
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
```

## What is HTML injection?

**Beware of user inputs**
  
All values provided by a user, however they get to the web server, should be viewed with great suspicion.

Users can provide input view form submissions, or the querystring. They can have functionality to upload files, and even data drawn from a database should be considered as 'user' input, and to be sanitized before using.

```
    # multiply two numbers and show the result
    get '/multiply/:x/:y' do
      result = params[:x].to_f * params[:y].to_f
      "the result is #{result}"
    end

    # where have we seen this before?...
```
