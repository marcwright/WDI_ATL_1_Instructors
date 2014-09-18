# Acts as List (c.45mins)

We want to look at why and how we use gems to address common functionality.

We frequently have a need for arranging items in lists - from shopping lists to lists of patients to be seen in a hospital waiting room.

It would be easy enough to re-create the functionality of ordering and reordering lists in our apps, but *maybe* there's a gem that does that too.

(https://github.com/swanandp/acts_as_list)[https://github.com/swanandp/acts_as_list]

We will frequently be faced with the choice of whether to do some simple functionality ourselves, or to use a gem that seems to perfom it. Sometimes the gem is a good choice, sometimes, it *can* cause us more work to get the gem working (but on top of that, sometimes the payback later down the line with advanced functionality is a great benefit)

```
  rails new todo_app

  cd todo_app

  rails g scaffold TodoList name
  rails g scaffold Item name todo_list:references position:integer
  rake db:migrate

  # gemfile
  gem 'acts_as_list'

  bundle

  # todo_list.rb
  has_many :items, order: :position

  # item.rb
  acts_as_list scope: :todo_list
```

When we're finished setting our models (or we think we are), head to the console to check everything works.

```
  # console
  l = TodoList.create name: 'bucket'
  l.items.create name: 'visit new york'
  l.items.create name: 'learn french'
  l.items.create name: 'drive a f1 car'
  l.items.create name: 'make friends with a rock star'
  l.items.create name: 'eat swan'
  l.items.create name: 'hold GBP1M in cash'
  l.items.create name: 'graduate high school'

  l.reload.items
  l.items.last.move_higher
  l.reload.items

  # to reorder if they get out of sync
  l.items.each {|i| i.move_to_top}
```

Once we're happy with the models, we can move onto the views

```
  # views/todo_list.show
  <p>
    <h2>items</h2>
    <ul>
      <% @todo_list.items.each do |item| %>
        <li>
          <%= item.name %>
        </li>
      <% end %>
    </ul>
  </p>
```

List items is great, but accessing the extra functionality the gem gives us is not many steps.

Setup the route:

```
  # routes
  resources :items do
    member do
      put 'move/:direction', to: 'items#move_in_list', as: 'move_in_list'
      end
  end
```

build the controller

```
  # items_controller
  def move_in_list
    @item = Item.find(params[:id])
    case params[:direction]
    when 'up'
      @item.move_higher
    when 'down'
      @item.move_lower
    end
    redirect_to @item.todo_list
  end
```

And add the functionality to the view

```
  # views/todo_list.show
  <%= link_to 'up', move_in_list_item_path(item, direction: 'up'), {method: :put} %> 
  <%= link_to 'down', move_in_list_item_path(item, direction: 'down'), {method: :put} %>
```
