# Devise


Devise is a flexible authentication solution for Rails. We're going to use it instead of 'rolling our own' authentication process as we have so far with 'has_secure_password'.


It is composed of 11 modules:

[i]: don't read these verbatim - just summarise them

  * Database Authenticatable: encrypts and stores a password in the database to validate the authenticity of a user while signing in. The authentication can be done both through POST requests or HTTP Basic Authentication.

  * Token Authenticatable: signs in a user based on an authentication token (also known as "single access token"). The token can be given both through query string or HTTP Basic Authentication.

  * Omniauthable: adds Omniauth (https://github.com/intridea/omniauth) support;

  * Confirmable: sends emails with confirmation instructions and verifies whether an account is already confirmed during sign in.

  * Recoverable: resets the user password and sends reset instructions.

  * Registerable: handles signing up users through a registration process, also allowing them to edit and destroy their account.

  * Rememberable: manages generating and clearing a token for remembering the user from a saved cookie.

  * Trackable: tracks sign in count, timestamps and IP address.

  * Timeoutable: expires sessions that have no activity in a specified period of time.

  * Validatable: provides validations of email and password. It's optional and can be customized, so you're able to define your own validations.

  * Lockable: locks an account after a specified number of failed sign-in attempts. Can unlock via email or after a specified time period.



## Getting Started with Devise

  git@github.com:Pavling/wdi-w7d2-devise.git

```
  # gemfile
  gem 'devise'

  bundle
```

You need to first run the generator.

```
  rails generate devise:install
```

The generator will install an initializer which describes all of Devise's configuration options and you _MUST_ take a look at it. 

It also lists some things you must do (and some things it recommends):

  1. Ensure you have defined default url options in your environments files. Here is an example of default_url_options appropriate for a development environment in config/environments/development.rb:

```
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }

  # In production, :host should be set to the actual host of your application.
```

  2. Ensure you have defined root_url to *something* in your config/routes.rb.
     For example:

```
   root to: "home#index"
```

  3. Ensure you have flash messages appearing.
     For example:

```
  <p class="notice"><%= notice %></p>
  <p class="alert"><%= alert %></p>
```


When you are done, you are ready to add Devise to any of your models using the generator:

```
  rails generate devise User
```

Replace 'User' by the class name used for your application's users, it's frequently User but could also be Admin. This will create a model (if one does not exist) and configure it with default Devise modules. 

(Have a look at the migration file that Devise has created...)

```
  rake db:migrate
```

The generator also configures your config/routes.rb file to point to the Devise controller, and Devise will create some helpers to use inside your controllers and views.

Add accessible attributes for User:

```
  attr_accessible :email, :password, :password_confirmation, :remember_me
```

Let's make the contacts_controller require authentication...

```
  before_filter :authenticate_user!
```

To verify if a user is signed in, use the following helper:

```
  user_signed_in?
```

For the current signed-in user, this helper is available (we _don't_ need to have our own in application controller):

```
  current_user
```

After signing in a user, confirming the account or updating the password, Devise will look for a scoped root path to redirect. Example: For a :user resource, it will use user_root_path if it exists, otherwise default root_path will be used. This is what the root_path is needed for.

But you can also overwrite after_sign_in_path_for and after_sign_out_path_for to customize your redirect hooks.

```
  # application_controller.rb
  protected
  def after_sign_in_path_for(resource)
    new_contact_path
  end

  # application.html.erb
	<div class='login'>
  	<% if current_user %>
  	  <%= current_user.email %>
  	  <%= link_to "Log out", destroy_user_session_path, method: :delete %>
  	<% else %>
  	  <%= link_to "Sign In", new_user_session_path %>
  	  <%= link_to "Register", new_user_registration_path %>
  	<% end %>
  </div>
```


If you are deploying on Heroku with Rails 3.2, you may want to set the following option in `config/application.rb`, which will force your application to not access the DB or load models when precompiling your assets.

```
   config.assets.initialize_on_precompile = false
```

## Customizing Devise

If you want to customise the Devise views for your app:

```
  rails g devise:views
```

This will add a folder to the views directory, and contains all the default Devise views and partials. Feel free to alter any however you want. If you delete any, Devise will fall back to using the views included in the gem.


