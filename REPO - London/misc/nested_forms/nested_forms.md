# NESTED FORMS


Sometimes, we need to manage a complex relationship, or create new dependent records from inside a parent form. 

Let's look at  our Cookbook app example: 

When we switched from a has_and_belongs_to_many  to a has_many :through relationship, we gained a new IngredientsRecipe class. 

This class had an attribute, "quantity", which described the amount of an ingredient the recipe needs. 

However, we were unable to set this amount from within the Recipe "create" or "update" forms.

This is where nested forms come in handy. 

Nested forms allow us to manage relationships like this from within a parent form. 

Ideally, we would like to be able to not just assign Ingredients to Recipes as we have done before, but also add quantities to the relationship model.


Configuration


Let's start with the gallery app starting point. 

In terminal:

    bundle install
    rake db:migrate

Run the app, and look at the functionality.

- - -

We can then start setting up "nested" routes for our app. In "routes.rb":

    GalleryApp::Application.routes.draw do
      root :to => "galleries#index"

      resources :galleries do 
        resources :paintings
      end 
    end

Rake routes to see the changes.

- - -

Now in the "paintings_controller.rb", we need to reflect that new association:

    def index
      @gallery = Gallery.find params[:gallery_id]
      @paintings = @gallery.paintings

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @paintings }
      end
    end

Similarly, in "views/galleries/show.html.erb":

```
<h1>
  <%= @gallery.name %>
</h1>
<div id="paintings">
  <% for painting in @gallery.paintings %>
    <div class="painting">
      <%= link_to gallery_painting_path(@gallery, painting) do %>
        <%= image_tag painting.image_url(:thumb)# if painting.image? %>
      <% end %>
      <div class="name">
        <%= link_to painting.title, painting %>
      </div>
      <div class="actions">
        <%= link_to "edit", edit_gallery_painting_path(@gallery, painting) %>
        |
        <%= link_to "remove", gallery_painting_path(@gallery, painting), :confirm => 'Are you sure?', :method => :delete %>
      </div>
    </div>
  <% end %>
  <div class="clear"></div>
</div>
<p>
  <%= link_to "Add a Painting", new_gallery_painting_path(@gallery) %>
  |
  <%= link_to "Edit Gallery", edit_gallery_path(@gallery) %>
  |
  <%= link_to "Remove Gallery", @gallery, :confirm => 'Are you sure?', :method => :delete %>
  |
  <%= link_to "View Galleries", galleries_path %>
</p>
```

Now into the "galleries_controller.rb", change the "new" function to:

```
  def new
    @gallery = Gallery.new
    3.times { @gallery.paintings.build }
  end
```


Then in "app/views/galleries/_form.html.erb":


```
<%= form_for @gallery do |f| %>
  <% if @gallery.errors.any? %>
    <div id="error_explanation">
      <h2>
        <%= "#{pluralize(@gallery.errors.count, "error")} prohibited this gallery from being saved:" %>
      </h2>
      <ul>
        <% @gallery.errors.full_messages.each do |msg| %>
          <li>
            <%= msg %>
          </li>
        <% end %>
      </ul>
    </div>
  <% end %>
  <div class="field">
    <%= f.label :name %>
    <%= f.text_field :name %>
  </div>
  <div class="field">
    <%= f.label :address %>
    <%= f.text_field :address %>
  </div>
  Paintings:
  <br/>
  <br/>
  <%= f.fields_for :paintings do |sub_form| %>
    <fieldset>
      <div class="field">
        <%= sub_form.label :title %>
        <%= sub_form.text_field :title %>
      </div>
    </fieldset>
  <% end %>
  <div class="actions">
    <%= f.submit 'Save' %>
  </div>
<% end %>
```

→ we now have the option to add a painting directly when creating/editing a gallery!

However, the form currently returns an error: "Can't mass-assign protected attributes: painting".

We thus need to get into our "gallery.rb" model, and add "paintings_attributes" to our "attr_accessible", along with a new element, "accepts_nested_attributes_for :paintings".

In "gallery.rb":

```
class Gallery < ActiveRecord::Base
  attr_accessible :address, :name, :paintings_attributes
  has_many :paintings
  accepts_nested_attributes_for :paintings
end
```

We can now extend our "_form.html.erb":

```
<%= form_for @gallery do |f| %>
  <% if @gallery.errors.any? %>
    <div id="error_explanation">
      <h2>
        <%= "#{pluralize(@gallery.errors.count, "error")} prohibited this gallery from being saved:" %>
      </h2>
      <ul>
        <% @gallery.errors.full_messages.each do |msg| %>
          <li>
            <%= msg %>
          </li>
        <% end %>
      </ul>
    </div>
  <% end %>
  <div class="field">
    <%= f.label :name %>
    <%= f.text_field :name %>
  </div>
  <div class="field">
    <%= f.label :address %>
    <%= f.text_field :address %>
  </div>
  Paintings:
  <br/>
  <br/>
  <%= f.fields_for :paintings do |sub_form| %>
    <fieldset>
      <div class="field">
        <%= sub_form.label :title %>
        <%= sub_form.text_field :title %>
      </div>
      <div class="field">
        <%= sub_form.label :artist %>
        <%= sub_form.text_field :artist %>
      </div>
      <div class="field">
        <%= sub_form.label :description %>
        <%= sub_form.text_field :description %>
      </div>
      <div class="field">
        <%= sub_form.label :price %>
        <%= sub_form.number_field :price %>
      </div>
      <div class="field">
        <%= sub_form.label :image %>
        <%= sub_form.file_field :image  → gives us the option to upload manually. %>
      </div>
      <div class="field">
        <%= sub_form.label :remote_image_url→ gives us the option to upload from a remote url %>
        <%= sub_form.text_field :remote_image_url %>
      </div>
    </fieldset>
  <% end %>
  <div class="actions">
    <%= f.submit 'Save' %>
  </div>
<% end %>
```

... and that's how we build nested forms in rails!

