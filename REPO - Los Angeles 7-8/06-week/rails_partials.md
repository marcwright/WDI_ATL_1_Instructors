#Rails partials

###What is a partial?

Partial templates - usually just called "partials" - are another device for breaking the rendering process into more manageable chunks. With a partial, you can move the code for rendering a particular piece of a response to its own file.

example of a partial

	_NameOfPartial.html.erb

How does Rails know how to use this in views?

	<= render NameOfPartial >

Partials are great for Navigation Headers and footer of what ever else you want to dry up

Q: Why not place everything in the application.html.erb?

A: Because maybe you have subsections with subnavs for those sections. Maybe everything that a partial could DRY up is not meant to be universal?

Today we'll create a navigation section for a simple website rails app.

Start by forking the sample code from the link below and then, from inside your github account clone it down to your local machine.

[https://github.com/thefonso/kata_website](https://github.com/thefonso/kata_website)

We'll then duplicate this navigation across the app so a user can navigate to pages from anywhere in the app.

We will then see how we can DRY this up with the use of a partial.

##render_to_string



##But this Rabbit hole goes deeper

**Partial Layouts**


A partial can use its own layout file, just as a view can use a layout. For example, you might call a partial like this:

	<%= render partial: "link_area", layout: "graybar" %>
	
This would look for a partial named _link_area.html.erb and render it using the layout _graybar.html.erb. Note that layouts for partials follow the same leading-underscore naming as regular partials, and are placed in the same folder with the partial that they belong to (not in the master layouts folder).

Also note that explicitly specifying :partial is required when passing additional options such as :layout.

**Passing Local Variables**

You can also pass local variables into partials. For example, you can use this technique to reduce duplication between new and edit pages, while still keeping a bit of distinct content:

new.html.erb

	<h1>New zone</h1>
	<%= render partial: "form", locals: {zone: @zone} %>
	
	
edit.html.erb

	<h1>Editing zone</h1>
	<%= render partial: "form", locals: {zone: @zone} %>
	
_form.html.erb

	<%= form_for(zone) do |f| %>
	  <p>
	    <b>Zone name</b><br>
	    <%= f.text_field :name %>
	  </p>
	  <p>
	    <%= f.submit %>
	  </p>
	<% end %>
	
Although the same partial will be rendered into both views, Action View's submit helper will return "Create Zone" for the new action and "Update Zone" for the edit action.

Every partial also has a local variable with the same name as the partial (minus the underscore). You can pass an object in to this local variable via the :object option:

##But wait it goes deeper

Every partial also has a local variable with the same name as the partial (minus the underscore). You can pass an object into this local variable via the :object option:

	<%= render partial: "customer", object: @new_customer %>
	
Within the customer partial, the customer variable will refer to @new_customer from the parent view.

If you have an instance of a model to render into a partial, you can use a shorthand syntax:

	<%= render @customer %>
	
Assuming that the @customer instance variable contains an instance of the Customer model, this will use _customer.html.erb to render it and will pass the local variable customer into the partial which will refer to the @customer instance variable in the parent view.

**Rendering Collections**

(what is a Collection?)



**source:**

More partial mayhem can be found at [Rails Guides](http://guides.rubyonrails.org/layouts_and_rendering.html#using-partials)