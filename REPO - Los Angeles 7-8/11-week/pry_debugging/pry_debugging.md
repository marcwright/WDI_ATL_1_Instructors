#PRY and Debugging

Learning Objectives:

- understanding how to use Pry first from the cli and then from inside a rails app

- students will be able to think through a method in your class using Pry

- you will learn how to use to_yaml, inspect and debug

- explore even more resources for debugging Rails apps



<!--I Do-->

##Debug, to_yaml, inspect

**Debug**

The debug helper will return a "\<pre>" tag that renders the object using the YAML format. This will generate human-readable data from any object. For example, if you have this code in a view:

	<%= debug @post %>
	<p>
  	  <b>Title:</b>
	  <%= @post.title %>
	</p>
	
You'll see something like this:

```
--- !ruby/object:Post
attributes:
  updated_at: 2008-09-05 22:55:47
  body: It's a very helpful guide for debugging your Rails app.
  title: Rails debugging guide
  published: t
  id: "1"
  created_at: 2008-09-05 22:55:47
attributes_cache: {}
 
 
Title: Rails debugging guide
```

**to_yaml**

Displaying an instance variable, or any other object or method, in YAML format can be achieved this way:

	<%= @post.to_yaml %>
	<p>
  	  <b>Title:</b>
  	  <%= @post.title %>
	</p>

The to_yaml method converts the method to YAML format leaving it more readable

If we **add simple_format**...

	<%= simple_format @post.to_yaml %>
	<p>
  	  <b>Title:</b>
  	  <%= @post.title %>
	</p>
	
simple_format is used to render each line as in the console...

```
--- !ruby/object:Post
attributes:
updated_at: 2008-09-05 22:55:47
body: It's a very helpful guide for debugging your Rails app.
title: Rails debugging guide
published: t
id: "1"
created_at: 2008-09-05 22:55:47
attributes_cache: {}
 
Title: Rails debugging guide
```


**inspect**

Another useful method for displaying object values is inspect, especially when working with arrays or hashes. This will print the object value as a string. For example:


	<%= [1, 2, 3, 4, 5].inspect %>
	<p>
  	  <b>Title:</b>
  	  <%= @post.title %>
	</p>

Will be rendered as follows:

	[1, 2, 3, 4, 5]
 
	Title: Rails debugging guide

##So let's play with these three in an app we've built before...

##wdi_dinosour

(here is a link to the code)

----

Now these are interesting and can help you a lot but I'd really like to chat about a tool that I like most for debugging...

##Pry

So we have this thing called 'irb'	and it's cool **BUT**

Pry is like irb on steroids!

	Note: We're gonna play with Pry in an Rails app in moment but first i want to chat about Pry by itself. To do that I'd like to chat about the cli version first....

To use it we want two gems...**pry** and **pry-doc**


install both gems

	gem install pry pry-doc
	
let's explore pry...

	pry(main)> help
	
two of my favorite commands are 'ls' and 'cd'. Let's check out help for ls...
	
	pry(main)> ls --help
	
ls is useful for when you forget the name of that variable you defined earlier, and cd can be useful for diving into objects.

Let's play with a class. We can change context into a class by calling any class. I'm going to demo using the main class Pry 
	
	pry(main)> cd Pry

So now we can list members of the Pry class including constants and variables.

	pry(Pry):1> ls -m
	
This can be a long list, so sometimes we may want to grep through this.

	pry(Pry):1> ls -m --grep ^p

Note how the prompt has changed...it has the name of the object we are inside and that '1' that tells us how deep we are? Another trick is ...

	pry(Pry):1> cd ..
	
To get us back were we started from

	pry(main)>
	
We can even 'up arrow' and go back to 'cd Pry'

	pry(main)> cd Pry
	
and run 'ls -m' again
	
	we should see our list of methods
	
let's cd inside one...

	pry(main)> cd main
	
Note how our prompt changed...'1' is now '2'

	pry(Pry):2> 
	
Let's use 'ls --help' again...

	pry(Pry):2> ls --help
	
and explore 'ls -l' and 'ls -g'

Now let's cd up a level

	pry(Pry):2> cd ..
	
sometimes we can get lost and ask Pry ...

	pry(Pry):1> whereami

now let's cd..

	pry(Pry):1> cd ..
	
and get back to main

	pry(main)>

Let's play with pry-doc

Pry Doc extends two core Pry commands: show-doc and show-source (aliased as ? and $ respectively). (Oh, and there's also show-method)

For example, in regular Pry it’s impossible to get the documentation for the loop method. However, Pry Doc solves that problem.

	pry(main)> loop
	
now
	
	pry(main)> ? loop
	
and then check the source code of the loop method.
	
	pry(main)> $ loop
	
So let's go back to our Pry object and peek into it's code...

	pry(main)> cd Pry
	
	pry(Pry):1> ls
	
	pry(Pry):1> main
	
	pry(Pry):1> show-doc main
	
	pry(Pry):1> show-source main
	
Now since we have the gem pry-doc. We can get pry to drop us inside the methods source...

	pry(Pry):1> edit main
	
Our systems default editor will open and drop us right into the code!

	Note: you may have to check your .bash_profile for the line ...
	
	export EDITOR="vim"
	
	...make sure it's set to 'vim' or 'nano'

Keep in mind...

- next

- exit

- [gem install pry-stack_explorer**](https://github.com/pry/pry-stack_explorer)

	NOTE: **Now, I've not played with pry-stack_explorer too much but it looks BOSS as hell, also note that it works for Ruby 1.9.3 and MAY NOT WORK for Ruby >= 2.0
	


##pry-rails / pry-doc

So let's play with pry in a Rails app

In your gemfile...

```
group :development, :test do
  gem 'pry-rails'
  gem 'pry-doc'
end
```
(after a quick bundle install...)
(oh, and restart your rails server...)

	bundle
	
	rails s

Now we can do the same as cli pry above inside our Rails app!



**binding.pry**

My favorite way to play with Pry in a Rails app is with

	binding.pry
	
	Note: this MUST be lower case
	
So anywhere you want to peek into your app just place 'binding.pry' right after it.

	Note: in both examples below, when you run the app in your browser. The app will freeze...switch to your iterm window, you will see pry dropped you into a pry prompt.

**example: inside a view**

	<h1>
	  	<ul>
			<% @dinos.each do |d| %>
		<%= binding.pry %>
				<li><%= d.name %></li>
			<% end %>
		</ul>
	</h1>
	
	note: use disable-pry*** OR Process.exit*** to exit the loop.
	with disable-pry*** you may have to restart rails s
	
**example: inside a controller**

```
class DinosController < ApplicationController
	def index
		@dinos = Dino.all
		binding.pry
	end 
	...
end
```
	note: attention to the diff between both binding.pry lines...no <%= %> here

Ok, so now you have knowledge, go play.


####challenge

Use Pry in one of your own apps, play with it.



###A Little EXTRA

The Debugger gem

	gem install debugger
	
Then start your server with the debugger option

	rails server --debugger
	
You will be placed at the debugger's prompt (rdb:n). The n is the thread number.

example

	@posts = Post.all
	(rdb:7)
	
[Read more about this gem](http://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debugger-gem)
	
##Plugins for Debugging

these three are the awesome sauce...

- [Exception Notifier](https://github.com/smartinez87/exception_notification/tree/master) Provides a mailer object and a default set of templates for sending email notifications when errors occur in a Rails application.

- [Better Errors](https://github.com/charliesome/better_errors) Replaces the standard Rails error page with a new one containing more contextual information, like source code and variable inspection.

- [RailsPanel](https://github.com/dejan/rails_panel) Chrome extension for Rails development that will end your tailing of development.log. Have all information about your Rails app requests in the browser - in the Developer Tools panel. Provides insight to db/rendering/total times, parameter list, rendered views and more.

##Sources

[Rails guides: debugging rails applications](http://guides.rubyonrails.org/debugging_rails_applications.html)

[pry rails cast](http://railscasts.com/episodes/280-pry-with-rails)

[pry-doc](https://github.com/pry/pry-doc)

[pry-rails](https://github.com/rweng/pry-rails)

[What is Binding.pry?](http://kyrylo.hatenablog.com/entry/2013/05/29/so-what-is-binding-pry-exactly)

[Pry FAQ](https://github.com/pry/pry/wiki/FAQ)

[***Pry FAQ: exit a loop call](https://github.com/pry/pry/wiki/FAQ#disable_pry)