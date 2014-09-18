# Routing and views lab

c. 1.5hr

- Create a /start page with links to an A page and a B page. 
- Create a home controller with all the actions in it. - Add a form with an input and a button. 

- The user can enter a 1, 2, or 3. 
- The forms work the same way as they do in Sinatra. When the button is clicked, it could be a GET or a POST, but since we are not changing data, you can use a GET. 
- Send the user to a page with the number they entered on it.

```
rails _3.2.19_ new routing_lab
```

In the routes.rb file.

```
get '/start' => 'home#start'
get '/a', to: 'home#a'
get '/b', to: 'home#b'
get '/1', to: 'home#one'
get '/2', to: 'home#two'
get '/3', to: 'home#three'
get '/door', to: 'home#door'
root to: 'home#start'
```

Create a home controller:

```
  touch app/controllers/home_controller.rb
```

In the home controller

````
  class HomeController < ApplicationController
    def start
      render 'menu'
    end

    def a
      @which_action = 'a'
      render 'menu'
    end

    def b
      @which_action = 'b'
      render 'menu'
    end

    def one
      @which_action = 1
      render 'menu'
    end

    def two
      @which_action = 2
      render 'menu'
    end

    def three
      @which_action = 3
      render 'menu'
    end

    def door
      case params['option'].downcase
        when 'a' then redirect_to('/a')
        when 'b' then redirect_to('/b')
        when '1' then redirect_to('/1')
        when '2' then redirect_to('/2')
        when '3' then redirect_to('/3')
        else render 'menu'
      end
    end
  end

Create the file:

```
mkdir app/views/home
touch app/views/home/menu.html.erb
```

Then in views/home/menu.html.erb:

```
  <a href='/a'>a</a><br>
  <a href='/b'>b</a><br>

  <form action='/door' method='get'>
    <input type='text' name='option'>
    <button>go!</button>
  </form>
```

Delete index.html




## Fanzine
  - Create a Rails app for a pop-band fan club. Have pages for each member of the band, their tour dates, image gallery. Bonus points for multiple pages per band member.

Give the students 15mins to wrack their brains, then draw a flow on the wall:

  - rails new fan_app
  - cd fan_app
  - rails g controller home
  - think about pages - for a 'Beatles' fanzine, we might have the following:
    - home
    - john
    - paul
    - george
    - ringo
    - bibliography
    - gallery
  - add actions to controller (not strictly necessary, but act as placeholders)
  - add routes (and root route)
  - create view files
    - touch app/views/home/gallery.html.erb
    - etc
  - add content to views
  - add navigation to layout
  - remove public/index.html
  - add some style with CSS :-)

