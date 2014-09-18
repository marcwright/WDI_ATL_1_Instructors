#Rails 4 / MongoDB -- Basic Breakdown

For the purposes of this cheatsheet, we're going to be making an app about **coffee**. We'll let you know when to replace words with those that match your own unique app!

(The source code to the coffee app is here.)

###Processes to run

- ```mongod``` -- your mongo listener (can be run from any directory, initiate this command in Terminal)
- ```rails s``` -- spins up your Rails server (has to be run from within your app directory, in Terminal, and you'll need ```mongod``` running if you don't want to get a **Moped** error)
- ```genghisapp``` -- the GUI peek at your DB (```mongod``` must be running, call this from Terminal from within any directory)

###Create your new app

1) *(in Terminal)* Start things off with the **rails new** command, give your app a name (no spaces!), and let Rails know that you won't be needing ActiveRecord (because we're using MongoDB) with the **--skip-active-record** flag. 

For our coffee app, this looks something like ```rails new coffeeshop --skip-active-record```

(Name your app whatever you like -- replace **coffeeshop** with your app's name!)

2) *(in Terminal)*  Change directories into the new app directory that you just made (whichever name you put in the rails new statement). 

For our coffee app, it'll be ```cd coffeeshop``` 

(cd into the directory that matches your app's name rather than **coffeeshop**)

3) Open the app in Sublime Text.

```subl .``` should do the trick.

###Set up Mongoid

4) *(in Sublime Text)* Open up the **Gemfile** and add the **mongoid** gem. We like to grab the latest from GitHub, but you're welcome to leave the version off and have **bundler** take care of it.

```gem 'mongoid', github: 'mongoid/mongoid'```

or 

```gem 'mongoid'```

5) *(in Terminal)* Run **bundle install** to bring the **mongoid** gem into your app.

```bundle install```

6) *(in Terminal)* Once the mongoid gem is installed, generate the **mongoid.yml** file using the **mongoid:config** generator.

```rails g mongoid:config```

###Generate a model

7) *(in Terminal)* Generate a model with a **rails g** statement. The *first* word after **rails g model** is the name of your model, and all subsequent words will be field names (fields default to strings, specify other types with **name:type** syntax). Remember that model names are **singular**!

For our coffee app, we'll make a model called **coffee** with fields **name** (string), **roast** (string), **origin** (string), and **quantity** (float). The statement we'll type into Terminal looks like: ```rails g model beans name roast origin quantity:float```

(your model will have a name/fields that are appropriate to your app; you don't need to have anything about beans or roasts or whatnot)

Once your model has been generated, you'll get a new Ruby file in the **app/models** directory, named after your model. In this case, it'll be called ```bean.rb``` and look something like this:

```
class Bean
  include Mongoid::Document
  field :name, type: String
  field :roast, type: String
  field :origin, type: String
  field :quantity, type: Float
end
```

8) *(optionally)* Seed (prepopulate) data using the **db/seeds.rb** file. Comments in that file should help you out, but the format is to set a **variable** named after your model (but *plural*) to a **create** statement for an **array** of new **objects** that match your **model**. 

For the coffee app, we'll seed some **beans** and it will look like this:

```beans = Bean.create([{name: "Wilson's Blend", roast: "dark", origin: "Sumatra", quantity: "1.0"}, {name: "Lorin's Light Roast", roast: "light", origin: "Kenya", quantity: "3.75" }])```

(your seed data will reflect the model you've created!)

To complete the seeding, we'll run ```rake db:seed``` in the Terminal.

Run ```genghisapp``` to confirm that your seed data was correctly raked over. (*Note: if you run ```rake db:seed``` more than one time, you will duplicate your seed data.*)

###Generate a controller (and views directory)

9) *(in Terminal)* Generate a controller with the **rails g** statement, this time specifying a controller and passing a *plural* version of your model name. No additional arguments are needed, although you may pass in action names.

For our coffee app, the controller generator statement looks like:

```rails g controller beans```

(In your app, you'll want to match up your model/controller names. Remember that controllers are plural!)

Rails will create a few things, including a controller file (in this case, **beans_controller.rb**) in **app/controllers**, some prebuilt **stylesheets** and **coffeescript** files, and a new directory in **app/views**. Here, our new views directory is called **beans** and it's empty.

###Start defining controller actions and creating corresponding views

And now, the meat of the Rails app! These actions can be defined in **any order**, so we'll stop the numbering for right now.

You may also do the controller action/route/view steps in any order, although Rails errors will prompt you for a **route** first, then a **controller action**, then a **view template**.

####Index

**Index** is generally used to list all (or a segment of) items of a given model from your database. Often, this information is high-level (the **Show** action is for more detail!), and it can be displayed in a variety of fashions (table, unordered list, divs, paragraphs, etc).

The HTTP verb for index is **GET**.

#####Route

Generally, the route for **index** is **/controller_name**, or **localhost:3000/controller_name**. 

For our coffee app, it'll be ```/beans``` or ```localhost:3000/beans```

In **config/routes.rb**, you may define the route for index using **resources** or long-form by specifying the **HTTP verb** and **route** on the left side of the **hashrocket** and the **controller/action pairing** on the right side.

For our coffee app, it looks like:

```resources :beans``` <-- choose one or the other; if you use resources, don't write the route long-form

or

```get 'beans/' => 'beans#index'```

(you'll want to swap out the correct names for your app)

#####Controller Action

We need to define the index action in the **controller** (it also needs to be called **index**; don't rename this).
Since we want to list all of our model items, we're going to set an instance variable that corresponds to a request for all of them.

For our coffee app, it looks like:

```
def index
		@beans = Bean.all
end
```

(you'll want to swap out names accordingly)

Remember to put an **end** for every **def** in your controller, and remember that since the **index** handles multiple items, the instance variable (```@beans```) is plural while the model (```Bean```) is still singular.

#####View Template

Navigate to the **app/views** directory, and open up the directory that matches your controller name (in this app, it's **beans**). Create a new file called **index.html.erb**. The name is important; it matches your route and controller action.

Index views generally loop through all instances of a given model item, so we'll take a look at that structure. Remember that you have plenty of flexibility here; you can use lists, tables, divs, paragraphs, or any HTML elements that you'd like.

The loop portion of the **embedded Ruby** isn't meant to be rendered on-page, so those ERB tags do not have the = sign. Start and end the loop as such:

```

<% @beans.each do |b| %>

<% end %>

```

(remember that each loop statement also gets an **end**)

In this loop, we're going to reference our **instance variable** from the controller -- in the coffee app, that's ```@beans```. We run an **each loop** on **@beans** and use the pipe to denote the name we'll use to refer to each single bean that's being looped through. Here, it's ```|b|``` for brevity, but use a letter or word that makes sense to you.

In between, place any HTML that you would like to loop through for each item. Use ```<%= %>``` ERB tags to make fields render on the page. Make sure that any code that you *don't* want repeated is on the outside of the loop.

For our coffee app, we might do:

```
	<h1>Today's Beans</h1>
	<ul>
		<% @beans.each do |b| %>
			<li>
				<strong> <%= b.name %> </strong> -- <%= b.roast %>
			</li>
		<% end %>
	</ul>
```

In this case, the ```<h1>``` lets us know what's going on on this view (a list of beans), the ```<ul>``` gives us an unordered list, and the loop populates ```<li>``` tags with **each** bean's **name** (in bold) and **roast**.

(you'll want to switch out for something that reflects your model and fields, and is appropriately formatted to your app!)

We'll come back to the index view template later, and add links for the **show** view and the **new** form.

At this stage, running ```rails s``` and navigating to ```localhost:3000/beans``` will render this view:

![image](images/coffee-index1.png)



####Show

**Show** is generally used to provide detail for a single record. Often, users will navigate to this view from **index**, looking for additional information. 

The HTTP verb for show is **GET**.

#####Route

Generally, the route for **show** is **/controller_name/id**, or **localhost:3000/controller_name/id**. It looks a lot like the **index** route, with an **id** specified so the app can select the correct record.

For our coffee app, it'll be ```/beans/:id``` or ```localhost:3000/beans/:id```

In **config/routes.rb**, you may define the route for show using **resources** or long-form by specifying the **HTTP verb** and **route** on the left side of the **hashrocket** and the **controller/action pairing** on the right side.

For our coffee app, it looks like:

```resources :beans``` <-- choose one or the other; if you use resources, don't write the route long-form

or

```get 'beans/:id' => 'beans#show', as: :bean```


The ```, as: :bean``` at the end of the route sets a **named route** of **bean_path** that we can use throughout the app. (Declaring routes with ```resources``` takes care of this step for us.)

(you'll want to swap out the correct names for your app, but ```:id``` remains a symbol since we don't know which record we'll be looking for until the user selects one)

#####Controller Action

We need to define the show action in the **controller** (it also needs to be called **show**; don't rename this).

Since we want to show a single item, we're going to set an instance variable that corresponds to a request for *just that item*.

For our coffee app, it looks like:

```
def show
		@bean = Bean.find(params[:id])
end
```
What we're doing with ```.find(params[:id])``` is looking for (finding) a record that corresponds to the unique **id** passed in.

(you'll want to swap out names accordingly)

Remember to put an **end** for every **def** in your controller, and remember that since the **show** handles a single item, the instance variable (```@bean```) is singular, the model (```Bean```) is still singular, and we look for the correct record with ```.find(params[:id])``` (a search based on the **id** of the record, since other fields may not be unique).

#####View Template

Navigate to the **app/views** directory, and open up the directory that matches your controller name (in this app, it's **beans**). Create a new file called **show.html.erb**. The name is important; it matches your route and controller action.

Show views can look any way you'd like them to, and we don't need a loop here; there's just one record, and we can access it with the **instance variable** noted in the **controller** (in this case, ```@bean```).

Craft your view template with any HTML that you would like to present details about this record. Since **show** is more drilled-down, we often choose to display more fields than in **index**.

For our coffee app, we might do:

```
	<h1> <%= @bean.name %> </h1>

	<p>This coffee is a <%= @bean.roast %> roast from <%= @bean.origin %>, and we have <%= @bean.quantity %> pounds available.</p>

	<%= link_to "Back to the list!", beans_path %>

```

Note that, versus the ```b``` of **index**, we're directly calling ```@bean``` to access its fields.

We also added a **link_to** that will send our user back to the **index** view (represented by its **named route** -- ```beans_path```). The named route for an index view will always be **name_of_controller (plural) underscore path**, so our coffee's index can be linked to via **beans_path**.

(you'll want to switch out for something that reflects your model and fields, and is appropriately formatted to your app!)

We'll come back to the show view template later, and add links for the **edit** form and **delete** action.

At this stage, running ```rails s``` and navigating to ```localhost:3000/beans/YOUR_ID_HERE``` (choose an ID from your collection in **genghisapp**) will render this view:

![image](images/coffee-show1.png)

####New

**New** is typically associated with a form for creating new records. It's one half of the **new/create** pairing (create is the post action that corresponds to new), and it's important to note that new alone doesn't save a record.

The HTTP verb for new is **GET**.

#####Route

Generally, the route for **new** is **/controller_name/new**, or **localhost:3000/controller_name/new**. It looks a lot like the **index** route, with the keyword **new** specified so the app knows it's time to enter a new record.

For our coffee app, it'll be ```/beans/new``` or ```localhost:3000/beans/new```

In **config/routes.rb**, you may define the route for show using **resources** or long-form by specifying the **HTTP verb** and **route** on the left side of the **hashrocket** and the **controller/action pairing** on the right side.

For our coffee app, it looks like:

```resources :beans``` <-- choose one or the other; if you use resources, don't write the route long-form

or

```get 'beans/new' => 'beans#new'```

(you'll want to swap out the correct names for your app)

#####Controller Action

We need to define the new action in the **controller** (it also needs to be called **new**; don't rename this).

Since we want to create a single item, we're going to set an instance variable that corresponds to *just that item*.

For our coffee app, it looks like:

```
def new
		@bean = Bean.new
end
```

(you'll want to swap out names accordingly)

Remember to put an **end** for every **def** in your controller, and remember that since **new** deals with a single item, the instance variable (```@bean```) is singular, the model (```Bean```) is still singular, and we specify that it's a new record with ```.new```.

#####View Template

Navigate to the **app/views** directory, and open up the directory that matches your controller name (in this app, it's **beans**). Create a new file called **new.html.erb**. The name is important; it matches your route and controller action.

New views can look any way you'd like them to, but they generally involve a form. You'll most likely make use of the **form_for** tag, and various form controls. (The [Rails docs](http://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html) are a great resource for finding syntax for these!)

For our coffee app, we might do:

```
	<h1> Add a new coffee! </h1>

	<%= form_for @bean do |f| %>
		Name: <%= f.text_field :name %>
		Roast: <%= f.text_field :roast %>
		Origin: <%= f.text_field :origin %>
		Quantity: <%= f.text_field :quantity %>

		<%= f.submit "Add beans!" %>

	<% end %>

	<%= link_to "Back to the list!", beans_path %>

```

We shorten things up by using ```|f|``` to represent the form, then calling each field with ```.text_field``` (we could also use other form controls, such as ```.check_box```). Since all of the fields in this app are strings (or numbers), text fields are great. We also threw in some text to help our users know which field they're working with (Rails has a ```.label``` method as well; you may use that in lieu of text if you're interested in styling your labels or otherwise distinguishing them from plain text), and after each ```text_field``` we used a **symbol** representing the field from our model that corresponds to that form input. At the end, there's a ```.submit``` -- the button that will submit our form once we have a post action.

We also added a **link_to** that will send our user back to the **index** view (represented by its **named route** -- ```beans_path```), just in case the user doesn't want to add a new bean at this time.

(you'll want to switch out for something that reflects your model and fields, and is appropriately formatted to your app!)


At this stage, running ```rails s``` and navigating to ```localhost:3000/beans/new``` will render this view:

![image](images/coffee-new1.png)

But the form shouldn't work yet! For that, we need….

####Create

**Create** is the other half of the **new/create** pairing, and it's the post action that corresponds to **new**. This is the action that actually saves your new record to the database.

The HTTP verb for create is **POST**.

#####Route

Generally, the route for **create** is **/controller_name/**, or **localhost:3000/controller_name/**. It looks a lot like the **index** route, because there's no special template for this action.

For our coffee app, it'll be ```/beans/``` or ```localhost:3000/beans/```, though your users will never directly navigate there.

In **config/routes.rb**, you may define the route for show using **resources** or long-form by specifying the **HTTP verb** and **route** on the left side of the **hashrocket** and the **controller/action pairing** on the right side.

For our coffee app, it looks like:

```resources :beans``` <-- choose one or the other; if you use resources, don't write the route long-form

or

```post 'beans/' => 'beans#create'```

Note that the HTTP verb has been swapped out for **post**, and the action is now **create**.

(you'll want to swap out the correct names for your app)

#####Controller Action

We need to define the create action in the **controller** (it also needs to be called **create**; don't rename this).
Since we want to create a single item, we're going to set an instance variable that corresponds to *just that item*.

We'll also need to pass in parameters that correspond to the form fields from our **new** action.

The action concludes with a conditional -- if the save works, the user is redirected to the index, and if something goes wrong, the form is re-rendered.

For our coffee app, it looks like:

```
	def create
		@bean = Bean.new(params.require(:bean).permit(:name, :roast, :origin, :quantity))
		if @bean.save
			redirect_to beans_path
		else
			render 'new'
		end
	end
```
Deconstructing the first line:

```@bean = Bean.new(params.require(:bean).permit(:name, :roast, :origin, :quantity))```

We're creating a new Bean, and we're going to **require** the bean object and **permit** the fields for which we've created inputs in the **form_for** in our **new.html.erb**. We don't have to include every field -- we could leave out any of them (though it helps to have more complete records by permitting as many fields as needed), and we intentionally exclude fields like **id** and **timestamps**.

Taking a look at the conditional, 

```

		if @bean.save
			redirect_to beans_path
		
```

If our new record saves to the database, we'll **redirect** to the **index** view (or, **beans_path** in this sample), where we should see our new record in the list.

```
		else
			render 'new'
		end

```
If our new record *doesn't* save -- for any number of reasons, such as server error, incorrectly entered information, etc. -- we'll **render** the form again so the user may re-attempt the submit. The difference here is that the **render** doesn't make a call to the server, as **redirect** does.

(you'll want to swap out names accordingly)

Remember to put an **end** for every **def** in your controller, and remember that since **new** deals with a single item, the instance variable (```@bean```) is singular, the model (```Bean```) is still singular, and we specify that it's a new record with ```.new```.

#####View Template

**Create** piggybacks off the view for **new**, so we don't make a view template for this action.


At this stage, running ```rails s``` and navigating to ```localhost:3000/beans/new``` will render the new view, and the form should work. Check your work by adding a new record, then visiting the **index** view to see that your new record has been successfully saved.

Testing out our form...

![image](images/coffee-new2.png)

successfully saves, then redirects to

![image](images/coffee-index2.png)

####Edit

**Edit** is typically associated with a form for modifying existing records. It's one half of the **edit/update** pairing (update is the post action that corresponds to edit), and it's important to note that edit alone doesn't save a record.

The HTTP verb for edit is **GET**.

#####Route

Generally, the route for **edit** is **/controller_name/id/edit**, or **localhost:3000/controller_name/id/edit**. It looks a lot like the **index** route, with an **id** passed in (so we know which record we're dealing with) and the keyword **edit** specified so the app knows it's time to edit that record.

For our coffee app, it'll be ```/beans/:id/edit``` or ```localhost:3000/beans/:id/edit```

In **config/routes.rb**, you may define the route for show using **resources** or long-form by specifying the **HTTP verb** and **route** on the left side of the **hashrocket** and the **controller/action pairing** on the right side.

For our coffee app, it looks like:

```resources :beans``` <-- choose one or the other; if you use resources, don't write the route long-form

or

```get 'beans/:id/edit' => 'beans#edit'```

(you'll want to swap out the correct names for your app, but ```:id``` remains a symbol since we don't know which record we'll be looking for until the user selects one)

#####Controller Action

We need to define the edit action in the **controller** (it also needs to be called **edit**; don't rename this).

Since we want to edit a single record, we're going to set an instance variable that corresponds to a request for *just that record*.

For our coffee app, it looks like:

```
def edit
		@bean = Bean.find(params[:id])
end
```

What we're doing with ```.find(params[:id])``` is looking for (finding) a record that corresponds to the unique **id** passed in.

(you'll want to swap out names accordingly)

Remember to put an **end** for every **def** in your controller, and remember that since **edit** deals with a single item, the instance variable (```@bean```) is singular, and the model (```Bean```) is still singular.

#####View Template

Navigate to the **app/views** directory, and open up the directory that matches your controller name (in this app, it's **beans**). Create a new file called **edit.html.erb**. The name is important; it matches your route and controller action.

*** ** It's likely that you'll want a **form_for** that's very similar to the one in your **new** action. Here, we have an opportunity to use a **form partial** to DRY things up (but we'll hold off on that until later in this cheatsheet).

For our coffee app, we might do:

```
	<h1> Edit this coffee! </h1>

	<%= form_for @bean do |f| %>
		Name: <%= f.text_field :name %>
		Roast: <%= f.text_field :roast %>
		Origin: <%= f.text_field :origin %>
		Quantity: <%= f.text_field :quantity %>

		<%= f.submit "Edit beans!" %>

	<% end %>

	<%= link_to "Back to the list!", beans_path %>

```

Essentially, this form is exactly like our **new** form. A good way to start (before refactoring) is to duplicate the view and swap out words to indicate that it's an edit.

(you'll want to switch out for something that reflects your model and fields, and is appropriately formatted to your app!)


At this stage, running ```rails s``` and navigating to ```localhost:3000/beans/YOUR_ID_HERE``` (choose an id from genghisapp) will render this view:

![image](images/coffee-edit1.png)

We can make these edits (I've changed the name and quantity), but they won't stick yet. Just like with **new**, we need an action to pair with this form, though in this case it's a patch rather than a post!

####Update

**Update** is the other half of the **edit/update** pairing, and it's the patch action that corresponds to **edit**. This is the action that actually saves your updated record to the database.

The HTTP verb for create is **PATCH**.

#####Route

Generally, the route for **update** is **/controller_name/id**, or **localhost:3000/controller_name/id**. It looks a lot like the **show** route, because there's no special template for this action.

For our coffee app, it'll be ```/beans/:id``` or ```localhost:3000/beans/:id```, though your users will never directly navigate there.

In **config/routes.rb**, you may define the route for show using **resources** or long-form by specifying the **HTTP verb** and **route** on the left side of the **hashrocket** and the **controller/action pairing** on the right side.

For our coffee app, it looks like:

```resources :beans``` <-- choose one or the other; if you use resources, don't write the route long-form

or

```patch 'beans/:id' => 'beans#update'```

Note that the HTTP verb has been swapped out for **patch**, and the action is now **create**.

(you'll want to swap out the correct names for your app)

#####Controller Action

We need to define the update action in the **controller** (it also needs to be called **update**; don't rename this).

Since we want to modify a single item, we're going to set an instance variable that corresponds to *just that item*, using ```.find(params[:id])```.

We'll also need to pass in parameters that correspond to the form fields from our **edit** action. Unlike **create**, we'll skip the ```.save``` and swap it for an ```.update_attributes```, passing in the **require** and **permit** methods on this statement.

The action, just like **create**, concludes with a conditional -- if the save works, the user is redirected to the index, and if something goes wrong, the form is re-rendered.

For our coffee app, it looks like:

```
	def update
		@bean = Bean.find(params[:id])
		if @bean.update_attributes(params.require(:bean).permit(:name, :roast, :origin, :quantity))
			redirect_to beans_path
		else
			render 'edit'
		end
	end
```

We're editing an existing Bean, and we're going to **require** the bean object and **permit** the fields for which we've created inputs in the **form_for** in our **edit.html.erb**. We usually want to permit all fields that exist in the **new** form.

Again, there's a conditional statement in this action. If our record saves, we'll send the user back to the index. If our modified record *doesn't* save -- for any number of reasons, such as server error, incorrectly entered information, etc. -- we'll **render** the form again so the user may re-attempt the submit. The difference here is that the **render** doesn't make a call to the server, as **redirect** does.

(you'll want to swap out names accordingly)

Remember to put an **end** for every **def** in your controller, and remember that since **new** deals with a single item, the instance variable (```@bean```) is singular, the model (```Bean```) is still singular, and we specify the specific record with ```.find(params[:id])```.

#####View Template

**Update** piggybacks off the view for **edit**, so we don't make a view template for this action.


At this stage, running ```rails s``` and navigating to ```localhost:3000/beans/YOUR_ID_HERE/edit``` (choose an id from genghisapp) will render the edit view, and the form should work. Check your work by changing a record, then visiting the **index** view to see that your edited record has been successfully saved.

Testing out our form...

![image](images/coffee-edit1.png)

successfully saves, then redirects to

![image](images/coffee-index3.png)

And our Wilson's Blend coffee has now been changed.


####Destroy

**Destroy** is the action that allows your users to delete a record from the database.

The HTTP verb for destroy is **DELETE**.

#####Route

Generally, the route for **destroy** is **/controller_name/id/**, or **localhost:3000/controller_name/id**. It looks a lot like the **show** route, because there's no special template for this action (we're deleting, so there's no view!).

For our coffee app, it'll be ```/beans/:id``` or ```localhost:3000/beans/:id```, though your users will never directly navigate there.

In **config/routes.rb**, you may define the route for show using **resources** or long-form by specifying the **HTTP verb** and **route** on the left side of the **hashrocket** and the **controller/action pairing** on the right side.

For our coffee app, it looks like:

```resources :beans``` <-- choose one or the other; if you use resources, don't write the route long-form

or

```delete 'beans/:id' => 'beans#destroy'```

Note that the HTTP verb is **delete**, and the action is now **destroy**.

(you'll want to swap out the correct names for your app)

#####Controller Action

We need to define the destroy action in the **controller** (it also needs to be called **destroy**; don't rename this).

Since we want to delete a single item, we're going to set an instance variable that corresponds to *just that item*, using ```.find(params[:id])```.

We then destroy the record by calling ```.destroy``` on it, and then redirecting to the index.

For our coffee app, it looks like:

```
	def destroy
		@bean = Bean.find(params[:id])
		@bean.destroy
		redirect_to beans_path
	end
```


(you'll want to swap out names accordingly)

Remember to put an **end** for every **def** in your controller, and remember that since **new** deals with a single item, the instance variable (```@bean```) is singular, the model (```Bean```) is still singular, and we specify the specific record with ```.find(params[:id])```.

#####View Template

**Destroy** doesn't have its own view template, but we'll need to call on it from somewhere. **Show** or **index** are good candidates; for this sample, we'll add a link_to in our **show** action for beans.

```
<%= link_to "Delete this bean!", bean, method: :delete, data: { confirm: 'Are you sure you want to delete it?' } %>
```


At this stage, running ```rails s``` and navigating to ```localhost:3000/beans/YOUR_ID_HERE/``` (choose an id from genghisapp), then clicking on the **'Delete this bean!'**, will prompt the user to confirm the delete, then remove the record. Check your work by deleting a record, then visiting the **index** view to see that your deleted record is, in fact, gone.

Testing out our link...

![image](images/coffee-delete1.png)

successfully deletes, then redirects to

![image](images/coffee-index4.png)

And our Wilson's Blend coffee has now been destroyed.

##Cleaning things up

Now that the basic CRUD actions are in place, let's add a **link_to** or two to make things easier on our users, and **DRY** up our controller actions.

###Connecting things up with link_to's

####Index to Show

Right now, our **index** doesn't have any meaningful links to connect us to the **show** views. Since our users don't have a way of knowing those Mongoid id's for each bean, we'll help them out by adding a **link_to** that sends them to the **show** for that particular bean.

```

	<% @beans.each do |b| %>
		<li>
			<strong> <%= b.name %> </strong> -- <%= b.roast %> <%= link_to "More details!", bean_path(b) %>
		</li>
	<% end %>

```

We pass ```(b)``` into ```bean_path``` because we need to route to a single bean's show view. We identify it with ```b``` because that's what's in the pipe -- ```|b|``` -- in our ```each``` loop above.

Our new index view:

![image](images/coffee-index5.png)


####Show to Edit

Now, let's send our user to the **edit** action from **show**.

First, we'll have to update our routes and set the **named route** for the edit bean path:

```get 'beans/:id/edit' => 'beans#edit', as: :edit_bean```

Now, linking to ```edit_bean_path``` from any view (or redirecting to it from a controller) will send you to the edit view for beans.

We can then use **edit_bean_path** in a link_to:

```<%= link_to "Edit this bean!", edit_bean_path(@bean) %>```

Our edit view template now includes three link_to's -- **edit**, **delete**, and back to **index**:

```

	<h1> <%= @bean.name %> </h1>

	<p>This coffee is a <%= @bean.roast %> roast from <%= @bean.origin %>, and we have <%= @bean.quantity %> pounds available.</p>

	<%= link_to "Edit this bean!", edit_bean_path(@bean) %>
	<%= link_to "Delete this bean!", @bean, method: :delete, data: { confirm: 'Are you sure you want to delete it?' } %>
	<%= link_to "Back to the list!", beans_path %>

```

And our new show view looks like:

![image](images/coffee-show2.png)

