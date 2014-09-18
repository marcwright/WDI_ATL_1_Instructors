# Authorization with CanCan(Can)

## The ACL is Dead - Zed Shaw
http://vimeo.com/2723800



CanCan is an authorization library for Ruby on Rails which restricts what resources a given user is allowed to access. All permissions are defined in a single location (the Ability class) and not duplicated across controllers, views, and database queries.

The currently maintained version is called 'CanCanCan', since Ryan Bates ceased maintaining the original source of CanCan.


We will first need an app to work in which has authorisation, and to add the cancan gem to our Gemfile.

```
  gem 'cancancan', '~> 1.9'
  bundle
```

We will create a migration which will add the column 'role' to our users table.

```
  rails g migration AddRoleToUsers role:string

  # db/migrate/20130824193739_add_role_to_users
  class AddRoleToUsers < ActiveRecord::Migration
    def change
      add_column :users, :role, :string
    end
  end
```

Now run your migration.

```
  rake db:migrate
```

And update your user model to include:

```
  def role?(role_to_compare)
    self.role.to_s == role_to_compare.to_s
  end
```

We will use cancan to manage the abilities of users.

``
  rails g cancan:ability 
```

Now in the generated file add:

```
  # app/models/ability.rb
  class Ability
    include CanCan::Ability
   
    def initialize(user)
      user ||= User.new
      if user.role? :admin
        can :manage, :all
      else
        can :read, User
      end
    end
  end
```

The `can` method has lots of options, read about them here: https://github.com/CanCanCommunity/cancancan/wiki/defining-abilities.

We can check abilities in controllers and views with `can?` and `cannot?`:

For individual records:

```
  can? :destroy, @recipe
```

Or class:

```
  <% if can? :create, Recipe %>
    <%= link_to "New Recipe", new_recipe_path %>
  <% end %>
```

In controller actions we can authorize with `authorize!`:

```
  authorize! :show, @recipe
```

Or we can use a shortcut helper, which will both load the controller's resource (@recipe in the RecipesController for instance) and authorize it for every action:

```
  load_and_authorize_resource
```

Now if we try and access a secure page using the user role, we will be displayed a CanCan error page. We can redirect from this error page, and add an alert message, by updating our ApplicationController to include this method:

```
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: "You can't access this page"
  end
```


## Beware of locking users out from even registering 

If you add `load_and_authorize_resource` to the users controller, you must give not-logged-in users the ability to create users - otherwise they cannot register to sign in.

```
  can :create, User
```


## Notes on 'role'

The process we use in this lesson is just one of a gazillion ways you can use CanCan to determine whether users are able to perform a task.

A 'role' is a very limited way of assigning users access rights, and is very similar to the Access Control List (ACL) approach, but it's a very common starting point for permissions; but only a start.

Generally, in real life applications, our permissions will need to be a little more flexible that just "admins can do this, users can do that"; we will quickly have situations where users can access *some* records, but not others (for instance, they may be able to view orders of their own customers, but not orders for other users' customers), and you will need to build the logic into the ability.rb file to support this.

Giving users a 'role' is just an extra layer of granularity we can build upon - but it certainly should not be viewed as the ending point.

