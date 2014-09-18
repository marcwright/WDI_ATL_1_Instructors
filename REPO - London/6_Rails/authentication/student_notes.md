# Authentication
  
Authentication is about making sure you know the identity of the person accessing your site.

Essentially, it's about asking for passwords, or other proof of identity.

But it doesn't guarentee anything... my wife knows my email password, so could "pretend" to be me


## Create an app to play with authentication

```
  rails new authentication

  rails g controller Secret index really_secret
  rails g controller Gossip index

  # routes
  get "secret", to: "secret#index"
  get "public", to: "public#index"
  get "really_secret", to: "secret#really_secret"

  # secret_controller
  def index
    render text: "Shhh! it's a sea-kwet!"
  end

  def really_secret
    render text: "Do not talk about Fight Club!"
  end

  # gossip_controller
  def index
    render text: "Shout it from the roof-tops!"
  end
```

At the moment, there's nothing protecting my secrets...


## HTTP Basic

A very simple form of authentication, which doesn't offer any confidentiality of transmitted credentials. So generally, you'd want to add HTTPS to this as a second layer of security.

```
  # secret_controller
  http_basic_authenticate_with name: "secret", password: "letmein"
```

If you add it to the application_controller it would apply to every controller

You can have different credentials for different actions:

```
  # secret_controller
  http_basic_authenticate_with name: "open", password: "password", only: :really_secret
```

This is a very quick and easy way of restricting access by password


## Rails' "secure_password" method

I was going to take you through creating a password-authentication system from scratch, but I'll skip that, and jump straight on to the built-in version in Rails.

Create a User model - the name of the field 'password_digest' is expected (but could be over-ridden).

```
  rails g model user email:string password_digest:string
  rake db:migrate
```

Uncomment (or add) the bcrypt gem in the gemfile.

```
  # Gemfile
  gem 'bcrypt-ruby', '~> 3.0.0'

  bundle

  rbenv rehash
```

Delete the `public/index.html` file, and the configure the app to have authentication functionality for users.

```
  # user.rb
  has_secure_password
  attr_accessible :email, :password, :password_confirmation
  validates :password, presence: true, on: :create
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }

  rails g scaffold_controller User email password_digest

  # routes
  root to: 'users#index'
  resources :users

  # users_controller
  class UsersController < ApplicationController
    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(params[:user])
      if @user.save
        redirect_to root_path, notice: "Signed up!"
      else
        render "new"
      end
    end
  end

  # app/views/users/index.html.erb
  <h1>Users</h1>
  <% @users.each do |user| %>
    <%= user.email %> 
    <%= user.password_digest %> 
  <% end %>

  # app/views/users/new.html.erb
  <h1>Sign Up</h1>
  <%= form_for @user do |f| %>
    <% if @user.errors.any? %>
      <div class="error_messages">
        <h2>Form is invalid</h2>
        <ul>
          <% for message in @user.errors.full_messages %>
            <li><%= message %></li>
          <% end %>
        </ul>
      </div>
    <% end %>
    <div class="field">
      <%= f.label :email %>
      <%= f.text_field :email %>
    </div>
    <div class="field">
      <%= f.label :password %>
      <%= f.password_field :password %>
    </div>
    <div class="field">
      <%= f.label :password_confirmation %>
      <%= f.password_field :password_confirmation %>
    </div>
    <div class="actions"><%= f.submit %></div>
  <% end %>
```

Go into the UI and create some users :-)

Because we're trying to approach our web development with REST, we want to make logging-in and logging-out a RESTful process. We're going to call a user's interaction with our web-app a 'session', and login will equate to 'creating a new' session, and logout will equate to 'deleting' a session (even though it's not an object stored in the DB, a session can be made RESTful this way).

```
  rails g controller sessions new create destroy

  # routes
  resources :sessions

  # sessions_controller
  class SessionsController < ApplicationController
    def new
    end

    def create
      if # how do we know if a user is authenticated?
        session[:user_id] = user.id
        redirect_to root_url, notice: "Logged in!"
      else
        flash.now.alert = "Invalid email or password"
        render "new"
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to root_url, notice: "Logged out!"
    end
  end

  # app/views/sessions/new.html.erb
  <h1>Log in</h1>
  <%= form_tag sessions_path do %>
    <div class="field">
      <%= label_tag :email %>
      <%= text_field_tag :email, params[:email] %>
    </div>
    <div class="field">
      <%= label_tag :password %>
      <%= password_field_tag :password %>
    </div>
    <div class="actions"><%= submit_tag "Log in" %></div>
  <% end %>
```

This is not quite working, since we haven't added the code to look up the user and check their authentication:

```
  # sessions_controller.rb
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end
```

When we log in successfully, where is the 'logged in' message?

```
  # layouts/application.html.erb
  <% flash.each do |name, msg| %>
    <div class="flash-message flash-message-<%= name %>">
      <%= msg %>
    </div>
  <% end %>
```

How do we know we're logged in after the flash message has gone?

```
  # application_controller.rb
  helper_method :current_user
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # layouts/application.html.erb
  <% if current_user %>
    <p>hello <%= current_user.email %></p>
  <% end %>
```


## How do we logout?

We need to visit the route that destroys our session. At the moment, this requires a DELETE request to the `/sessions/:id` path. Maybe it would be more idiomatic to create a new route?

```
  #routes.rb
  get 'logout', to: 'sessions#destroy', as: 'logout'

  #application.html.erb
  <p>
    <%= link_to 'log me out!', logout_path %>
  </p>
```


## What happens if we delete a user that's logged in?

Because the `current_user` method finds a user with the `session[:user_id]` if there is no user that matches the id, Rails will raise an exception.

Either change it to be `find_by_id` or catch the exception. It's also worth deleting the `session[:user_id]` value if it's invalid.

```
  begin
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue ActiveRecord::RecordNotFound 
    session[:user_id] = nil
  end
```


## SSL

If you want to always ensure your sessions controller is accessed via SSL, add `force_ssl` - it doesn't force in development, only production, and setting up SSL is beyond the scope of this lesson... but... if you feel ambitious: 

http://www.railway.at/2013/02/12/using-ssl-in-your-local-rails-environment/
  

## Forgotten passwords?

You are not able to decrypt a user's password, so if they forget it, you would need some mechanism to reset it.

We can also use gems that give us authentication and extra functionality like password reseting, inviting friends, and integration with other authorisation (like Gmail, or Facebook)

We'll revist them in week 7!

