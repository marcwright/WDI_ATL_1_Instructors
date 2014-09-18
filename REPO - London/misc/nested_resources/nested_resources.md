In this article, I'll walk through a basic Rails (3.2.x) setup for creating a nested resource for two models. Nested resources work well when you want to build out URL structure between two related models, and still maintain a RESTful convention. This code assumes you are running RVM to manage Ruby/Gem versions, and Git for version control.

## Creating a new Rails project

```shell
$ rails new family # version control 
$ cd family # install rails 
```

## Create two models (Parent & Child)

```shell
# Parent model 
$ rails generate scaffold Parent name:string 
# Child model 
$ rails generate scaffold Child name:string parent:references 
# Create db (defaults to SQLite3) 
$ rake db:migrate 
# version control 
```

## Review un-nested routes

```shell
$ rake routes
   children GET    /children(.:format)          children#index
            POST   /children(.:format)          children#create
  new_child GET    /children/new(.:format)      children#new
 edit_child GET    /children/:id/edit(.:format) children#edit
      child GET    /children/:id(.:format)      children#show
            PUT    /children/:id(.:format)      children#update
            DELETE /children/:id(.:format)      children#destroy
    parents GET    /parents(.:format)           parents#index
            POST   /parents(.:format)           parents#create
 new_parent GET    /parents/new(.:format)       parents#new
edit_parent GET    /parents/:id/edit(.:format)  parents#edit
     parent GET    /parents/:id(.:format)       parents#show
            PUT    /parents/:id(.:format)       parents#update
            DELETE /parents/:id(.:format)       parents#destroy
```

## Adding model relationships

```ruby
# file: app/models/parent.rb
class Parent < ActiveRecord::Base
  attr_accessible :name
  has_many :children
end

# file: app/models/child.rb
class Child < ActiveRecord::Base
  attr_accessible :name, :parent_id
  belongs_to :parent
end

```

## Nesting the routes

```ruby
# file: config/routes.rb
resources :parents do
  resources :children
end
```

```shell
$ rake routes
  parent_children GET    /parents/:parent_id/children(.:format)          children#index
                  POST   /parents/:parent_id/children(.:format)          children#create
 new_parent_child GET    /parents/:parent_id/children/new(.:format)      children#new
edit_parent_child GET    /parents/:parent_id/children/:id/edit(.:format) children#edit
     parent_child GET    /parents/:parent_id/children/:id(.:format)      children#show
                  PUT    /parents/:parent_id/children/:id(.:format)      children#update
                  DELETE /parents/:parent_id/children/:id(.:format)      children#destroy
          parents GET    /parents(.:format)                              parents#index
                  POST   /parents(.:format)                              parents#create
       new_parent GET    /parents/new(.:format)                          parents#new
      edit_parent GET    /parents/:id/edit(.:format)                     parents#edit
           parent GET    /parents/:id(.:format)                          parents#show
                  PUT    /parents/:id(.:format)                          parents#update
                  DELETE /parents/:id(.:format)                          parents#destroy
```

## Adding test data via Rails console

```shell
$ rails c

> dad = Parent.new(name: 'Paul')
 => #<Parent id: nil, name: "Paul", created_at: nil, updated_at: nil> 

> dad.save
   (0.1ms)  begin transaction
  SQL (3.0ms)  INSERT INTO "parents" ("created_at", "name", "updated_at") VALUES (?, ?, ?)  [["created_at", Wed, 29 Jan 2014 23:37:23 UTC +00:00], ["name", "Paul"], ["updated_at", Wed, 29 Jan 2014 23:37:23 UTC +00:00]]
   (1.5ms)  commit transaction
 => true 

> son = dad.children.new(name: 'Eric')
 => #<Child id: nil, name: "Eric", parent_id: 1, created_at: nil, updated_at: nil> 

> daughter = dad.children.new(name: 'Mara')
 => #<Child id: nil, name: "Mara", parent_id: 1, created_at: nil, updated_at: nil> 

> exit
```

## Adding a private controller method to load the Parent object for each method

```ruby
# file: app/controllers/children_controller.rb
@@ -1,4 +1,7 @@
 class ChildrenController < ApplicationController
+
+  before_filter :load_parent
+
   # GET /children
   # GET /children.json
   def index
@@ -80,4 +83,11 @@ class ChildrenController < ApplicationController
       format.json { head :no_content }
     end
   end
+
+  private
+
+    def load_parent
+      @parent = Parent.find(params[:parent_id])
+    end
+
 end
```

At this point, each controller and view for the Child class model needs to be adjusted (links, redirection, form, etc)

Method: children#index

```ruby
# file: app/controllers/children_controller.rb

   def index
-    @children = Child.all
+    @children = @parent.children.all
```

```erb
# file: app/views/children/index.html.erb

-    <td><%= link_to 'Show', child %></td>
-    <td><%= link_to 'Edit', edit_child_path(child) %></td>
-    <td><%= link_to 'Destroy', child, confirm: 'Are you sure?', method: :delete %></td>
+    <td><%= link_to 'Show', parent_child_path(@parent, child) %></td>
+    <td><%= link_to 'Edit', edit_parent_child_path(@parent, child) %></td>
+    <td><%= link_to 'Destroy', [@parent, child], confirm: 'Are you sure?', method: :delete %></td>
 
-<%= link_to 'New Child', new_child_path %>
+<%= link_to 'New Child', new_parent_child_path(@parent) %>
```

Method: children#new

```ruby
# file: app/controllers/children_controller.rb

   def new
-    @child = Child.new
+    @child = @parent.children.new
```

```erb
# file: app/views/children/_form.html.erb

-<%= form_for(@child) do |f| %>
+<%= form_for([@parent, @child]) do |f| %>
```

```erb
# file: app/views/children/new.html.erb

-<%= link_to 'Back', children_path %>
+<%= link_to 'Back', parent_children_path(@parent) %>
```

Method: children#create

```ruby
# file: app/controllers/children_controller.rb

   def create
-    @child = Child.new(params[:child])
+    @child = @parent.children.new(params[:child])
 
     respond_to do |format|
       if @child.save
-        format.html { redirect_to @child, notice: 'Child was successfully created.' }
+        format.html { redirect_to [@parent, @child], notice: 'Child was successfully created.' }
```

Method: children#show

```ruby
# file: app/controllers/children_controller.rb

   def show
-    @child = Child.find(params[:id])
+    @child = @parent.children.find(params[:id])
```

```erb
# file: app/views/children/show.html.erb

-<%= link_to 'Edit', edit_child_path(@child) %> |
-<%= link_to 'Back', children_path %>
+<%= link_to 'Edit', edit_parent_child_path(@parent, @child) %> |
+<%= link_to 'Back', parent_children_path(@parent) %>
```

Method: children#edit

```ruby
# file: app/controllers/children_controller.rb

   def edit
-    @child = Child.find(params[:id])
+    @child = @parent.children.find(params[:id])
```

```erb
# file: app/views/children/edit.html.erb

-<%= link_to 'Show', @child %> |
-<%= link_to 'Back', children_path %>
+<%= link_to 'Show', parent_child_path(@parent, @child) %> |
+<%= link_to 'Back', parent_children_path(@parent) %>
```

Method: children#update

```ruby
# file: app/controllers/children_controller.rb

   def update
-    @child = Child.find(params[:id])
+    @child = @parent.children.find(params[:id])
 
     respond_to do |format|
       if @child.update_attributes(params[:child])
-        format.html { redirect_to @child, notice: 'Child was successfully updated.' }
+        format.html { redirect_to [@parent, @child], notice: 'Child was successfully updated.' }
```

Method: children#destroy

```ruby
# file: app/controllers/children_controller.rb

   def destroy
-    @child = Child.find(params[:id])
+    @child = @parent.children.find(params[:id])
     @child.destroy
 
     respond_to do |format|
-      format.html { redirect_to children_url }
+      format.html { redirect_to parent_children_path(@parent) }
```

Method: parents#

```erb
# file: app/views/parents/show.html.erb

-<%= link_to 'Back', parents_path %>
+<%= link_to 'Back', parents_path %> |
+<%= link_to 'Children', parent_children_path(@parent) %>
```

At this point, the default scaffolding's links and redirection have been updated to work with the nested routes.

