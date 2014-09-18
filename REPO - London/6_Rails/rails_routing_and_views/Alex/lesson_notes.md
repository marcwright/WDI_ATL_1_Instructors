# Routing and views 

In this lesson, we are going to cover "routing" in Rails.

- When a user makes a request to the browser
- The web-application needs to know what content to show them
- It needs to know where to find this content
- For this, we need to use Rails routing engine

###Let's compare with a file that we have already seen

- Let's look at the recipes_controller.rb file from your cookbook homework.
- In Sinatra we defined the routes within our controller's action itself:

```
get '/recipes' do
  @recipes = Recipe.all
  erb :'recipes/index'
end 

get '/recipes/new' do
  @recipe = Recipe.new
  @categories = Category.all
  erb :'recipes/new'
end
```
###However, in Rails - controller actions and routes are seperated.

##HTTP Verbs
HTTP defines methods (usually referred to as verbs) to indicate the desired action to be performed on the identified resource.

- **GET:** Requests using GET should only retrieve data and should have no other effect.
- **POST:** Requests that the server accept the entity enclosed in the request as a new subordinate of the web resource identified by the URI.

Routing is a combination of an HTTP verb (POST, GET, PUT, DELETE) and the params in the requested path (/www.website.co.uk/person/3).


##Make a new rails app

	rails new routing_app

- Rails has a "routing engine" that separates it's routing instructions from the controller action.
- Rails automatically generates it for you when you create a new app. You can find it here: 

```
app/config/routes.rb
```

##We need a controller action 
*(For the engine to route to)*

Create a new home controller (without using scaffold):

```
touch app/controllers/home_controller.rb
```

Then let's make a controller action to route to:

```
class HomeController < ApplicationController
  
  def about_us
    render text: "hello from Rails! This is all about us..."
  end
    
end
```

##Next we need to define the route for this action

In `app/config/routes.rb` delete all the comments and replace with:

```
get '/about_us', to: 'home#about_us'
```

Let's have a look at this then:

```
rails s
http://localhost:3000
```
Navigate in your browser to: `http://localhost:3000/about_us`
    
##Rake Routes

We can see all of the routes defined in our application by running:

```
rake routes
```
		
## Add some more   
Examples:

```
get '/faqs', to: 'home#faqs'
get '/terms_and_conditions', to: 'home#terms'
```

Add the actions to the home_controller.rb

```
def faqs
  render text: "Question, questions questions..."
end

def terms
  render text: "Terms..."
end
```

##Views

Just like in sinatra, we have a directory for views, and everything for the user to see goes in there.

```
mkdir app/views/home
  
touch app/views/home/about_us.html.erb
touch app/views/home/faqs.html.erb
touch app/views/home/terms.html.erb  
```  

Move your render text there.

##Application.html.erb

- This is similar to the layout.erb file that we used for Sinatra.
- It also has a `yield`.

- Add some navigation links

```
<nav>
  <ul>
    <li><a href='/about_us'>About Us</a></li>
    <li><a href='/faqs'>Faqs</a></li>
    <li><a href='/terms_and_conditions'>Terms & Conditions</a></li>
  </ul>
</nav>
```
    
##A Root route (the homepage)

There is a slightly different syntax for creating a root route.

```
root to: 'home#about_us'
```
Make sure you delete: `delete public/index.html`

##Further

http://guides.rubyonrails.org/v3.2.17/routing.html
