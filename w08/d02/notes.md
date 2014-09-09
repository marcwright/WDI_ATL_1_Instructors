## What / Why AJAX
  - Don't have to send full pages
  - How did our rails apps work before?
  - send request, get a new view
## AJAX vs get vs getJSON

```
$.ajax({
  url: "/todos",
  datatype: "json"
  type: "GET",
});
```

## Demo

## JS + Rails
- update
- create
- delete

## New Rails App

- One model: Character
  - name: string, not null
  - dead: boolean, default false
  - timestamps
- Model
- Test the model, seed the database with a few characters
- Routes
  - Root to index
- Create Controller and View (with ul of character names)

---

- Add data attribute, checkboxes, X
- update routes to include update
- Where does JS go?
- Update action, check rake routes, check DB
- On checkbox change
- render json
  - 200 ok
  - 400 bad request
- Update the DOM when response comes back

---

- Add fieldset
- on form submit
- serialize, serializeArray, serializeObject
- Append character
- Reset form (need to pass context)
  - This object will be made the context of all Ajax-related callbacks.

---

- on click of the X
- ajax
- pass context to remove from dom after

---

`rails new thrones -T -d postgresql`

```
group :development, :test do
  gem 'pry-rails'
end
```

`rails g migration CreateCharacters`

```
    create_table :characters do |t|
      t.string :name, null: false
      t.boolean :dead, default: false

      t.timestamps
    end
```

`rake db:migrate`

`Model`

```
Character.create([
  {name:'Ned Stark'},
  {name:'Robert Baratheon'},
  {name: 'Jaime Lannister'}
])
```

```
root 'characters#index'
resources :characters, only: [:destroy, :index, :create, :update]
```

```
class CharactersController < ApplicationController

  def index
    @characters = Character.all
  end

end
```

```
<h1>Winter is Coming</h1>

<ul>
  <% @characters.each do |character| %>
    <li data-character-id="<%= character.id %>" class="<%= character.dead ? "dead" : '' %>">
      <%= character.name %>
      <%= check_box_tag :dead, 'yes', character.dead %>
      <span>&times;</span>
    </li>
  <% end %>
</ul>
```

```
$(function(){});
```


## AJAX Music Player

## AJAX Google Maps