# Planets App Code-Along | 13:15 - 15:00

- NOTE: ensure to cover routing for resources, and the controller actions, generate scaffold

We're going to work through all the Rails stuff we've covered in the last two days. To do this we will create an app to store astronomical information about the planets. We're going to skip scaffold to create the views and actions ourselves - a good opportunity to get more exposure to how these things tie together.


What attributes do planets have?

  - a name, an image, an orbit (how far it is from the sun), a diameter, a mass, and a number of moons. (Note: 1 AU is the distance between Earth and the Sun.) This sounds a bit like some of the object-oriented programming we did last week.

## Getting going

After discussion the attributes and settling on a subset, create the app:

```
  rails new planets -d postgresql
```

- check the gemfile and the database.yml - notice the PG configuration

- remove the DB username and password FROM ALL CONNECTIONS!


In SQLite, Rails will create the database file for us, but in Postgres we have to create the DB - but Rails gives us a command (which will create a DB whatever the engine we use - so we only need to remember one command)

```
  rake db:create
```

Create the planet model - no scaffold remember!

```
  rails g model Planet name:string image:text orbit:float diameter:float mass:float moons:integer
```

edit the migration and add `limit: 2` to the moons field definition

```
  rake db:migrate

  rails c

  Planet.create(name: 'Earth', moons: 1, orbit: 1)
  Planet.create(name: 'Mars', moons: 2, orbit: 1.5)
  Planet.create(name: 'Jupiter', moons: 67, orbit: 5.2)

  Planet.all
```

## Seed our DB for future reference

```
  # db/seeds.rb

  Planet.delete_all

  Planet.create(name: 'Earth', moons: 1, orbit: 1)
  Planet.create(name: 'Mars', moons: 2, orbit: 1.5)
  Planet.create(name: 'Jupiter', moons: 67, orbit: 5.2)
```

```
  rake db:seed
```

## Firstly - Set up Routing

```
  resources :planets
```

`rake routes` - look at what's generated


## Then Controller actions

```
  touch app/controllers/planets_controller.rb

  class PlanetsController < ApplicationController
    def index
      @planets = Planet.all
    end
  end
```

## And views

```
  mkdir app/views/planets
  touch app/views/planets/index.html.erb

  # in index view
  <% @planets.each do |planet| %>
    <%= planet.name %> has <%= pluralize(planet.moons, 'moon') %>.
    <br>
  <% end %>

  # in layouts/application.html.erb
  <nav>
    <ul>
      <li><%= link_to('Planets', planets_path) %></li>
      <li><%= link_to('New Planet', new_planet_path) %></li>
    </ul>
  </nav>
```

# break here....


# Planets app continued | 15:15 - 17:00

Keep following the "Routes, Controller Action, View" process...

```
  # check routes for 'new' path

  # PlanetsController
  def new
    @planet = Planet.new
  end

  touch app/views/planets/new.html.erb

  # planets/new.html.erb
  <%= form_for @planet do |f| %>
    <%= f.label :name %>
    <%= f.text_field :name %>
    <br>
    <%= f.label :image %>
    <%= f.text_field :image %>
    <br>
    <%= f.label :orbit %>
    <%= f.text_field :orbit %>
    <br>
    <%= f.label :diameter %>
    <%= f.text_field :diameter %>
    <br>
    <%= f.label :mass %>
    <%= f.text_field :mass %>
    <br>
    <%= f.label :moons %>
    <%= f.text_field :moons %>
    <br>
    <%= f.submit 'planet me!' %>
  <% end %>
```

```
  # PlanetsController
  def create
    render text: 'test'
  end
```

- check in Chrome dev tools
  - page headers, form data

- or "render text: params.inspect"

```
  # replace in PlanetsController create action
  Planet.create(params[:planet])
  redirect_to(planets_path)
```

```
  # PlanetsController
  def show
    @planet = Planet.find(params[:id])
  end

  touch app/views/planets/show.html.erb

  # show.html.erb
  <h1><%= @planet.name %></h1>
  <%= image_tag(@planet.image) %>
```

How do we use the named routes?

```
  rails c
  app.planets_path
  app.planet_path  # breaks!
  app.planet_path(3)
```

We can call `planets_path` and `planet_path(:planet_id)` directly in our views:

```
  # index.html.erb
  <%= link_to("Show #{planet.name}, planet_path(planet)) %>
```

## Deleting planets (Death Star method?)

```
  # controller
  def destroy
    planet = Planet.find(params[:id])
    planet.destroy # Never... ever... ever call `.delete`. Get in good habits now!
    redirect_to(planets_path)
  end

  # index view
  <%= button_to('Delete Planet', planet_path(planet), method: :delete, confirm: 'Energise the demolition beam?') %>
```


## Editing planets (terraforming?)

```
  # controller
  def edit
    @planet = Planet.find(params[:id])
  end

  # edit view
  cp app/views/planets/new.html.erb app/views/planets/edit.html.erb

  # index page
  <%= link_to('Edit Planet', edit_planet_path(planet)) %>
```

Handle the submitted edits with an `update` action:

```
  def update
    planet = Planet.find(params[:id])
    planet.update_attributes(params[:planet])
    redirect_to(planets_path)
  end
```
