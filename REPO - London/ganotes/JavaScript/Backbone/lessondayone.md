# Backbone, day one

## Notes to instructors
- This will be much easier if students git commit as they go; 'git diff' becomes a useful tool when people mess stuff up. 
- If your students don't follow along, they will seriously lose their way; we'll be returning to this material in later days.

## Preframing: why Backbone? 

- Remember back on the first day, in the first lesson, I said that the internet is just text? And you've written code that takes in text and outputs other text? And that made you web developers? 
- Why aren't we actually doing that? 
  - Why Sinatra? 
  - Why Rails? 
  - Why one over the other? 
- Frameworks help us structure our code, and keep it neat. 
  - And stop us having to write boilerplate (routing, rendering, DB access)
  - And help us work with others by following the conventions that spring up around particular frameworks. 
  - They're particularly beneficial when working with larger applications.


## What is it? 

- Backbone is a JavaScript framework. 
- Just like Rails makes it easier for us to write Ruby web apps, Backbone makes it easier for us to write JavaScript apps. 
- Much like Rails, it's built using model-view-controller. 
- We use Backbone to build bigger apps; it gives us some support, and does some 'heavy lifting' for us. 
- So by necessity we're going to build something fairly big and advanced; otherwise it won't make much sense. 


## Let's get started. 

- Create a directory in your classwork folder for this project. 
- Go download Backbone: http://backbonejs.org/ and get the development version. 
  - Depends on Underscore: http://underscorejs.org/
  - And on jQuery: http://jquery.com/download/
- Let's get it up and running. 
  - create an index.html
  - include the dependencies
  - include backbone
  
  - Create a div with an id of `app_container` and a string saying the application is loading.
  - Create a JS file to contain your app, and include it. 
  - Git commit. 


## Backbone Views

- In this case we're creating a static HTML page, but this *could* be a view rendered by our web server.
- Backbone has a concept of 'views' that are slightly different. 'View' doesn't mean "an HTML page rendered by the server", it means "a view onto some data". This is true when talking about the backend too. 
- A Backbone view has an HTML element - a DOM element - that the JavaScript view 'looks after'. It's going to handle displaying it and updating it for us. 
- Let's start creating a view for our main app. 
  
  ```
  myApp.Views.AppView = Backbone.view.extend({
    el: '#app_container', 
    initialize: function() { 
      alert("I'm the initializer!"); 
    }
  });

  var appView = new myApp.Views.AppView();
  ```

- Refresh your page. It should show you an alert.
- Let's do a render method.

  ```
  render: function() { 
    this.$el.html("Hello world!"); 
    return this; 
  }
  ```

- It doesn't work. Why doesn't it work? (document.ready). 
- Every Backbone View gets a utility variable $el that we can use. It's a jQuery object. 


### Templates

- It's a bit crap if we have to put our HTML in our JS file. 
  - Bad separation of concerns
  - Makes our JS big
  - Harder to change
- Let's put it in a template instead. 

  ``` 
  <script type="text/template" id="tmpl_hello">
    <p>Hello, <%= name %></p>
  </script>
  ```

- And update our render method to use it. 

  ``` 
  render: function() { 
    var my_template = _.template($('#tmpl_hello').html());
    this.$el.html(my_template({name: 'Alex'}));
    return this; 
  }
  ```

- Hit refresh, see it. 
- Do you see how this works? 
  - We've grabbed the contents of our template, and instantiated an Underscore template with it, which we called `my_template` . 
  - We then updated the HTML of our element by calling our template, and passing it some data. 


## But this is still static data...

- But we're still rendering static stuff. Let's make it more dynamic. 
  
  ```
  getName: function() { 
    var names = ["Alex", "Tim", "Clem", "Andy"];
    return names[Math.floor(Math.random() * names.length)];
  }

  render: function() { 
    var my_template = _.template($('#tmpl_hello').html());
    this.$el.html(my_template({name: this.getName()}));
    return this; 
  }
  ```

## Models

- This is supposed to be a photo gallery, and we've got a basic proof of concept up that shows we can update our HTML from Backbone. 
- Let's add an image. 
  - We're going to create an Image model, and an associated view for it. That is, a way to render one image. 
  - We're also going to create a Collection - something to hold our images. 
  - Then we're going to create a view for our collection. 
  - Our collection will then draw a new image whenever we add an image. 

- Create the model, and its view. 

  ```
  myApp.Models.Image = Backbone.Model.extend({
    defaults: {
      title: '',
      url: ''
    }
  });

  myApp.Views.ImageView = Backbone.View.extend({
    tagName: 'li',

    render: function() {
      var my_template = _.template($('#tmpl_image').html());
      this.$el.html(my_template({title: this.model.get('title'), url: this.model.get('url')}));
      return this;
    }
  });
  ```

  - (Note we're passing in the params from our model, and we use .get() to retrieve the values.)
  - We use tagName instead of an el, because we want to create a new one each time. See docs. 

```
<script type="text/template" id="tmpl_image">
  <h1><%= title %></h1>
  <img src="<%= url %>" alt="<%= title %>" />
</script>
``` 

``` 
  myApp.Collections.Gallery = Backbone.Collection.extend({
      model: myApp.Models.Image
  });

  myApp.Views.GalleryView = Backbone.View.extend({
      el: '#demo_images',

      initialize: function() {
          this.collection = new myApp.Collections.Gallery();
          this.collection.bind('add', this.appendItem, this);
      },

      add: function(title, url) {
          var image = new Image();
          image.set('title', title);
          image.set('url', url);
          this.collection.add(image);
      },

      appendItem: function(image) {
          var imageView = new myApp.Views.ImageView({ model: image });
          this.$el.append(imageView.render().el);
      }
  });

  var gallery = new myapp.Views.GalleryView();
  gallery.add('Steve Zizzou', 'http://www.fillmurray.com/200/310');
  gallery.add('Venkman', 'http://www.fillmurray.com/205/320');
```

  - Our initialize function creates a new Gallery. 
  - Our add method creates a new Image, and adds it to our gallery. 
  - Our appendItem method gets called automatically whenever we add an item to the gallery. This method draws it. 
  - we bind our 'this' to the View object, so when this.appendItem is called it gets the correct context. 


### CSS break! 

- Let's make this less ugly. 

- background color
- header
- margins
- images all on one line. 

```
body {
    background-color: #aac;
}

#container {
    max-width: 960px;
    margin-left: auto;
    margin-right: auto;
}
header {
    text-align: center;
    background-color: #004;
    color: #eee;
    min-height: 80px;
    border-bottom: 1px solid #eee;
}

header h1 {
    margin-top: 0;
}

li {
    display: inline-block;
    border: 1px solid black;
    margin-right: 5px;
    vertical-align: top;
}
li h1 {
    font-size: 120%;
    text-align: center;
}
```

## Your turn: an address book 

- So it's time for a lab. Let's start building a basic address book. 
  - Create a model to represent a person.
  - And a template to display it. 
  - And a view that handles the displaying of the content. 
  - And hook it up together. 
  - Don't worry about entering data for now, just hard-code something for the time being. 
  - And you can probably not worry too much about the nested views for now, just have the one controller. 


