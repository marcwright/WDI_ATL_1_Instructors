# Routing and views 

c. 1hr

- Routing is how web-browser requests get directed to actions in controllers
- Combination of HTTP verb (POST, GET, PUT, DELETE) and the path (/www.website.co.uk/person/3)

- in Sinatra we define with:

```ruby
  get '/video' {}
  post '/new' {}
```
- Rails has a "routing engine" that separates this from the controller.
```
  touch app/controllers/home_controller.rb
```

```ruby
  class HomeController < ApplicationController
    def about_us
      render text: "hello from Rails! This is all about us..."
    end
  end
```
- Rails.root/config/routes.rb

  delete all the comments and replace with:

```
    get '/about_us', to: 'home#about_us'
```
  then:

```
    rails s
    http://localhost:3000
```
    http://localhost:3000/about_us
    
    rake routes
```    
- add some more:

  faq... map... terms_and_conditions
  
- Views
  Just like in sinatra, we have a directory for views, and everything for the user goes in there

  mkdir app/views/home
  
  touch app/views/home/about_us.html.erb
  # move the "render" text into here...
  
  same for faq, etc.
  
- layouts? already there....

- add some navigation links
    <nav>
      <ul>
        <li><a href='/home'>HOME</a></li>
        <li><a href='/about'>ABOUT</a></li>
        <li><a href='/faq'>FAQ</a></li>
      </ul>
    </nav>
    
- root route
    root to: 'home#homepage'
    touch app/views/home/home_page.html.erb
    
    doesn't work...
    ...what does it say?
    "delete public/index.html"


http://guides.rubyonrails.org/v3.2.17/routing.html
