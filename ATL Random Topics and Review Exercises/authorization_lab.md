# Authorization with Roles

If authentication is about making sure you know the identity of the person accessing your site, authorization is the process of determining what each person can do.

We're going to add the functionality to determine if a logged-in user is an administrator, or if they're just a 'normal' user.


(working on a *COPY* of the app we were putting authentication in - we'll need another copy later for the CanCan lesson)

To change permissions depending on user role, we will need to create a migration which will add the column role to our users table.

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

Now we will be able to create a new user in irb with a role.

```
  User.create email: "email@email.com", password: "password", password_confirmation: "password", role: "admin"
```

We will now update our application controller to add a method to determine if the user can access the route they're trying to, and a before filter for it.

```
  class ApplicationController < ActionController::Base
    helper_method :current_user
    before_filter :can_access_route?

    private
    def can_access_route?
      raise 'Permissions rejected' unless authorized?(current_user, params[:controller], params[:action])
    end

    private
    def authorized?(user, controller, action)
      case user.try(:role)
        when "admin"
          then true
        else # for "user" or "nil" as role
          case controller
            when "secret" then false
            when "gossip" then true
          else 
            true
          end
      end
    end

  end
```
