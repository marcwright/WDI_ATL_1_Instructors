# Backbone, The Primer

## Part II. Using Views

Views create linkage between data sources (Models and Collections) and display elements. As a general rule, Views should map one-to-one with each data source present – meaning  that one view controller is created for each collection and each model represented within the display.

### Creating a view's container element

All Backbone views are attached to a *container element*, or an HTML document element into which all nested display and behavior is allocated. A common approach is to bind major views onto predefined elements within the HTML Document Object Model (hereforth referred to as the "DOM"). For example:

```
 <ul id="muppets-list"></ul>

 <script>
 var MuppetsListView = Backbone.View.extend({
	el: '#muppets-list'
 });
 </script>
```

In the above example, a Backbone view class is configured to reference `"#muppets-list"` as its target `el`, or *element*. This element reference is a *selector string* that gets resolved into a DOM element reference.

Another common workflow is to have Backbone views create their own container elements. To do this, simply provide a `tagName` and an optional `className` for the created element:

```
var MuppetsListItemView = Backbone.View.extend({
	tagName: 'li',
	className: 'muppet'
});
```

These two container element patterns (*selecting* and *creating*) are commonly used together. For example, a collection may attach itself to a selected DOM element, and then create elements for each item in the collection.

Once a view class is defined, we'll next need to instance it:

```
var MuppetsListView = Backbone.View.extend({
	el: '#muppets-list'
});

// Create a new view instance:
var muppetsList = new MuppetsListView();

// Append content into the view's container element:
muppetsList.$el.append('<li>Hello World</li>');
```

When a view is instanced, Backbone will configure an `$el` property for us––this is a jQuery object wrapping the view's attached container element. This reference provides a convenient way to work with the container element using the jQuery API.

Backbone also encourages efficient DOM practices using jQuery. Rather than performing large and expensive operations across the entire HTML document, Backbone views provide a `$` method that performs jQuery operations locally within the view's container element:

```	
// Find all "li" tags locally within the view's container:
muppetsList.$('li');
```

Under the hood, using `view.$('…')` is synonymous with calling `view.$el.find('…')`. These localized queries greatly cut down on superflous DOM operations.

### Attaching a view's data source

A view is responsible for binding its document element to a model or a collection instance, provided to the view as a *constructor option*. For example:

```	
var myModel = new MyModel();
var myView = new MyView({model: myModel});

// The provided model is attached directly onto the view:
console.log(myView.model === myModel); // << true
```

Attach a model to a view by providing a `{model: …}` constructor option:

```
var KermitModel = Backbone.Model.extend({
	url: '/muppets/1'
	defaults: { . . . }
});

var MuppetsListItemView = Backbone.View.extend({
	tagName: 'li',
	className: 'muppet',
	
	initialize: function() {
		console.log(this.model); // << KermitModel!!
	}
});

// Create Model and View instances:
var kermitModel = new KermitModel();
var kermitView = new MuppetsListItemView({model: kermitModel});
```

Attach a collection to a view by providing a `{collection: …}` constructor option:

```
var MuppetsModel = Backbone.Model.extend({ . . . });

var MuppetsCollection = Backbone.Collection.extend({
	model: MuppetsModel,
	url: '/muppets'
});

var MuppetsListView = Backbone.View.extend({
	el: '#muppets-list',
	
	initialize: function() {
		console.log(this.collection); // << MuppetsCollection!!
	}
});

// Create Collection and View instances:
var muppetsList = new MuppetsCollection();
var muppetsView = new MuppetsListView({collection: muppetsList});
```

In the above examples, the provided data sources are attached directly to their view instances, thus allowing the views to reference those sources as `this.model` or `this.collection`. It will be the view's job to render its data source into its DOM element, and pass user input data from the DOM back into its data source.

Also note, the above examples leverage Backbone's `initialize` method. `initialize` is called once per object instance at the time the object is created, and is therefore useful for configuring new objects. Any Backbone component may define an `initialize` method.

### Rendering a View

Among the primary responsibility of a view is to render data from its data source into its bound DOM element. Backbone is notoriously unopinionated about this task (for better or worse), and provides no fixtures for translating a data source into display-ready HTML. That's for us to define.

However, Backbone does prescribe a workflow for *where* and *when* rendering occurs:

1. A views defines a `render` method. This method generates HTML from its data source, and installs that markup into the view's container element.
2. A view binds event listeners to its model. Any changes to the model should trigger the view to re-render.

A simple implementation:

```
 <div id="kermit-view"></div>

 <script>
	var KermitModel = Backbone.Model.extend({
		url: '/muppets/1',
		defaults: {
			name: '',
			occupation: ''
		}
	});
	
	var KermitView = Backbone.View.extend({
		el: '#kermit-view',
		
		initialize: function() {
			this.listenTo(this.model, 'sync change', this.render);
			this.model.fetch();
			this.render();
		},
		
		render: function() {
			var html = '<b>Name:</b> ' + this.model.get('name');
			html += ', occupation: ' + this.model.get('occupation');
			this.$el.html(html);
			return this;
		}
	});	
	
	var kermit = new KermitModel();
	var kermitView = new KermitView({model: kermit});
 </script>
```

In the above example, a simple render cycle is formed:

1. The view's `render` method translates its bound model into display-ready HTML. The rendered HTML is inserted into the view's container element. A `render` method normally returns a reference to the view for method-chaining purposes.
2. The view's `initialize` method binds event listeners to the model for `sync` and `change` events. Either of those model events will trigger the view to re-render. The view then fetches (loads) its model, and renders its initial appearance.

At the core of this workflow is *event-driven behavior*. View rendering should NOT be a direct result of user interactions or application behaviors. Manually timing `render` calls is prone to errors and inconsistancies. Instead, rendering should be a simple union of data and display: when the data changes, the display updates.

### Rendering with templates

To simplify the process of rendering model data into display-ready markup, parsed HTML templates are commonly used. An HTML template looks generally like this:

```
 <p><a href="/muppets/<%= id %>"><%= name %></a></p>
 <p>Job: <i><%= occupation %></i></p>
```

Look familiar? Template rendering on the front-end is very similar to server-side HTML rendering. We just need a JavaScript template utility to parse these template strings.

There are numerous JavaScript template libraries available. For some reason, [Handlebars](https://github.com/wycats/handlebars.js/) is incredibly popular among Backbone developers… personally, I find this odd considering that Underscore has a [perfectly capable template renderer](http://underscorejs.org/#template) built in, and is thus omnipresent all Backbone apps. For this primer, we'll be using the Underscore template renderer.

To implemented a front-end template, we first need to define the raw-text markup. Here's a quick and easy trick for hiding raw template text within HTML documents: include the raw text in a `<script>` tag with a bogus script type. For example:

```
 <script type="text/template" id="muppet-item-tmpl">
	<p><a href="/muppets/<%= id %>"><%= name %></a></p>
	<p>Job: <i><%= occupation %></i></p>
 </script>
```

The above `<script>` tag defines a bogus `type="text/template"` attribute. This isn't a valid script type, so the script tag's contents are ignored by HTML parsers. However––we can still access that ignored script tag within the DOM, extract its raw text content, and parse that text into a template. To create a JavaScript template, we do this:

```
var tmplText = $('#muppet-item-tmpl').html();
var muppetTmpl = _.template(tmplText);
```
	
The Underscore `template` method parses our raw text into a reusable *template function*. This template function may be called repeatedly with different data sources, and will generate a parsed HTML string for each source. For example, let's quickly load and render Kermit:

```	
var muppetTmpl = _.template( $('#muppet-item-tmpl').html() );
var kermit = new KermitModel();

kermit.fetch().then(function() {
	var html = muppetTmpl(kermit.toJSON());
});

 // Resulting HTML string:
 <p><a href="/muppets/1">Kermit</a></p>
 <p>Job: <i>being green</i></p>
```

In the above example, a `KermitModel` is created and fetched, and then rendered to HTML after its data is loaded. To generate HTML markup, we simply invoke the template function and pass in a data source. The process is pretty straight-forward until we get to that mysterious `toJSON` call. What's that?

In order to render a Backbone Model using a generic template, we must first serialize the model into primitive data. Backbone provides a `toJSON` method on Models and Collections for precicely this reason; `toJSON` will serialize a *plain object* representation of these proprietary data structures.

Let's revise the earlier rendering example to include a parsed template:

```
 <div id="kermit-view"></div>

 <script type="text/template" id="muppet-tmpl">
	<p><a href="/muppets/<%= id %>"><%= name %></a></p>
	<p>Job: <i><%= occupation %></i></p>
 </script>

 <script>
	var KermitModel = Backbone.Model.extend({
		url: '/muppets/1',
		defaults: {
			name: '',
			occupation: ''
		}
	});
	
	var KermitView = Backbone.View.extend({
		el: '#kermit-view',
		template: _.template($('#muppet-tmpl').html()),
		
		initialize: function() {
			this.listenTo(this.model, 'sync change', this.render);
			this.model.fetch();
			this.render();
		},
		
		render: function() {
			var html = this.template(this.model.toJSON());
			this.$el.html(html);
			return this;
		}
	});	
	
	var kermit = new KermitModel();
	var kermitView = new KermitView({model: kermit});
 </script>
```

Using a parsed template greatly simplifies the `render` method, especially as the size and complexity of the rendering increases. Also note that our template function is generated once and cached as a member of the view class. Generating template functions is slow, therefore it's best to retain a template function that will be used repeatedly.

### Binding DOM events

Next up, a view must capture user input events--whether that's an element click, text input, or changes in keyboard focus. Backbone Views provide a convenient way of declaring user interface events using an `events` object. The `events` object defines a mapping of DOM event triggers to handler methods on the view.

```
 <div id="kermit-view">
	<label>Name:</label> <input type="text" name="name" class="name">
	<button class="save">Save</button>
 </div>

 <script>
	var KermitView = Backbone.View.extend({
		el: '#kermit-view',
		
		events: {
			'change .name': 'onChangeName',
			'click .save': 'onSave'
		},
		
		onChangeName: function(evt) {
			this.model.set('name', evt.currentTarget.value);
		},
		
		onSave: function(evt) {
			this.model.save();
		}
	});
	
	var kermitView = new KermitView({model: new KermitModel()});
 </script>
```

To summarize the structure of the above `events` object:

- Events triggers are declared as *keys* on the `events` object, formatted as `"[event_type] [selector]"`.
- Event handlers are declared as string *values* on the `events` object; each handler name cites a method available in the view.

Be mindful that event handler methods should be kept fairly simple, and remain focused on how each DOM event trigger relates to a behavior of the underlying model.
	
### A simple REST application

Now its time to put it all together. Let's breakdown a complete RESTful application that performs all CRUD methods with our API.

#### 1. The DOM

The first step in setting up any small application is to establish a simple interface for managing the tasks you intend to perform. Here, we've establish a `"muppets-app"` container element with a list (`<ul>`) for displaying all Muppet items, and a simple input form for defining new muppets.

Down below, a template is defined for rendering individual list items. Note that our list item template includes a "remove" button for clearing the item from the list.

Finally, we'll include our application's JavaScript as an external script. We can assume that all further example code will be included in `muppet-app.js`.

```
 <div id="muppets-app">
	<ul class="muppets-list"></ul>
	
	<div class="muppet-create">
		<b>Add a Muppet</b>
		<fieldset>
			<label for="muppet-name">Name:</label>
			<input id="muppet-name" type="text">
		</fieldset>
		<fieldset>
			<label for="muppet-job">Job:</label>
			<input id="muppet-job" type="text">
		</fieldset>
		<button class="create">Create Muppet!</button>
	</div>
 </div>

 <script type="text/template" id="muppet-item-tmpl">
	<p><a href="/muppets/<%= id %>"><%= name %></a></p>
	<p>Job: <i><%= occupation %></i></p>
	<button class="remove">x</button>
 </script>

 <script src="muppet-app.js"></script>
```

#### 2. The Model and Collection

Now in `"muppet-app.js"`, the first structures we'll define is the Model class for individual list items, and the Collection class for managing a list of models. The Collection class is configured with the URL of our API endpoint.

```
// Model class for each Muppet item
var MuppetModel = Backbone.Model.extend({
	defaults: {
		id: null,
		name: null,
		occupation: null
	}
});

// Collection class for the Muppets list endpoint
var MuppetCollection = Backbone.Collection.extend({
	model: MuppetModel,
	url: '/muppets'
});
```

#### 3. A List Item View

The first View class that we'll want to define is for individual list items. This class will generate its own `<li>` container element, and will render itself with our list item template. That template function is being generated once, and then stored as a member of the class. All instances of this class will utilize that one parsed template function.

This view also configures an event for mapping clicks on the "remove" button to its model's `destroy` method (which will remove the model from its parent collection, and then dispatch a `DELETE` request from the model to the API).

```
// View class for displaying each muppet list item
var MuppetsListItemView = Backbone.View.extend({
	tagName: 'li',
	className: 'muppet',
	template: _.template($('#muppet-item-tmpl').html()),
	
	render: function() {
		var html = this.template(this.model.toJSON());
		this.$el.html(html);
		return this;
	},
	
	events: {
		'click .remove': 'onRemove'
	},
	
	onRemove: function() {
		this.model.destroy();
	}
});
```

#### 4. A List View

Now we need a view class for rendering out lists of items, and capturing input from the "create" form.

This view binds a listener to its collection that will trigger the view to render whenever the collection finishes syncing with the API. That will force our view to re-render when initial data is loaded, or when items are created or destroyed.

This view renders a list item for each model in its collection. It first finds and empties its list container (`"ul.muppets-list"`), and then loops through its collection, building a new list item view for each model in the collection.

Lastly, this view configures an event that maps clicks on the "create" button to collecting form input, and creating a new collection item based on the input data.

```
// View class for rendering the list of all muppets
var MuppetsListView = Backbone.View.extend({
	el: '#muppets-app',
	
	initialize: function() {
		this.listenTo(this.collection, 'sync', this.render);
	},
	
	render: function() {
		var $list = this.$('ul.muppets-list').empty();
		
		this.collection.each(function(model) {
			var item = new MuppetsListItemView({model: model});
			$list.append(item.render().$el);
		}, this);
		
		return this;
	},
	
	events: {
		'click .create': 'onCreate'
	},
	
	onCreate: function() {
		var $name = this.$('#muppet-name');
		var $job = this.$('#muppet-job');
		
		if ($name.val()) {
			this.collection.create({
				name: $name.val(),
				occupation: $job.val()
			});
			
			$name.val('');
			$job.val('');
		}
	}
});
```

#### 5. Instantiation

Finally, we need to build instances of our components. We'll construct a collection instance to load data, and then construct a list view instance to display it. When our application components are all configured, all that's left to do is tell the collection to `fetch` for data!

```
// Create a new list collection, a list view, and then fetch list data:
var muppetsList = new MuppetsCollection();
var muppetsView = new MuppetsListView({collection: muppetsList});
muppetsList.fetch();
```

### Getting View Support

View management is by far the least regulated component of Backbone, and yet is –ironically– among the most uniquely disciplined roles in front-end engineering. While `Backbone.View` provides some very useful low-level utility features, it provides few high-level workflow features. As a result, major Backbone extenstions including [Marionette](http://marionettejs.com/) and [LayoutManager](https://github.com/tbranyen/backbone.layoutmanager) have become popular. Also see [ContainerView](https://github.com/gmac/backbone.containerview) for a minimalist extension of core Backbone.View features.

Thanks for reading. That's Backbone in a nutshell.