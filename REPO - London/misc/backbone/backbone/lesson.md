# Backbone

## Notes to instructors

- This will go a lot easier if you get them to git commit as they go. 
  - As they can then do 'git diff' to review their changes since their last commit, which helps find where they messed up. 
- You might like to explain that if they don't follow along, they're going to get seriously lost, and will lose the whole day. 
  - More than one day.
  - Try not to scare them; the last thing you want is them to go "Oh well, lost at 10AM, might as well tune out." 


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
  var AppView = Backbone.view.extend({
    el: '#app_container', 
    initialize: function() { 
      alert("I'm the initializer!"); 
    }
  });

  var appView = new AppView();
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

By convention, we always `return this;` from `render` functions - so we can chain calls.

## Models

- This is supposed to be a photo gallery, and we've got a basic proof of concept up that shows we can update our HTML from Backbone. 
- Let's add an image. 
  - We're going to create an Image model, and an associated view for it. That is, a way to render one image. 
  - We're also going to create a Collection - something to hold our images. 
  - Then we're going to create a view for our collection. 
  - Our collection will then draw a new image whenever we add an image. 

- Create the model, and its view. 

  ```
  var Image = Backbone.Model.extend({
    defaults: {
      title: '',
      url: ''
    }
  });

  var ImageView = Backbone.View.extend({
    tagName: 'li',

    render: function() {
      var my_template = _.template($('#tmpl_image').html());
      this.$el.html(my_template({title: this.model.get('title'), url: this.model.get('url')}));
      return this;
    }
  });
  ```

  - (Note we're passing in the params from our model, and we use .get() to retrieve the values.)
  - We use tagName instead of an el, because we want to create a new one each time. [See docs](http://backbonejs.org/#View-extend). 

```
<script type="text/template" id="tmpl_image">
  <h1><%= title %></h1>
  <img src="<%= url %>" alt="<%= title %>" />
</script>
``` 

``` 
  var Gallery = Backbone.Collection.extend({
      model: Image
  });

  var GalleryView = Backbone.View.extend({
      el: '#demo_images',

      initialize: function() {
          this.collection = new Gallery();
          this.collection.bind('add', this.appendItem, this);
      },

      add: function(title, url) {
          var image = new Image();
          image.set('title', title);
          image.set('url', url);
          this.collection.add(image);
      },

      appendItem: function(image) {
          var imageView = new ImageView({ model: image });
          this.$el.append(imageView.render().el);
      }
  });

  var gallery = new GalleryView();
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


## Adding our own images

So... we can now add images in our code. Let's allow the user to add images themselves. 

- Let's remove the 'app_container' div. That was just for prototyping now. 
- Update the el for the appcontroller to match the new ID. 
- Add a form to the HTML. 

```
<form id="add" action="#">
    <label for="title">Title</label><input id="title" name="title" placeholder="Your image's title" />
    <label for="url">URL</label><input id="url" name="url" placeholder="http://www.example.com/picture.jpg" />
    <input type="submit" value="Add" />
</form>
```

- Add an events property to our AppView. 
```
events: {'submit form#add': 'addImage'},
```

- Add an 'addImage' method to the AppView.
```
addImage: function(ev) {
    ev.preventDefault();
    var $titleInput = $('#title');
    var $urlInput = $('#url');
    this.gallery.add($titleInput.val(), $urlInput.val());
    $titleInput.val('');
    $urlInput.val('');
}
```
  - ev.preventDefault() to stop the form actually being submitted
  - Pass the details through to the gallery
  - Clear the input fields, ready for the next addition.


# What about delete? 

- We can add this just by reference to the Image; our Gallery doesn't care. 
- Add some JS to remove it: 
  ```
  // In ItemView.
  events: { 'click .remove', 'remove' },
  remove: function() { 
    this.$el.remove();
  }
  ```
  - Remove, not delete, because delete is a reserved word
  - .remove() is a jQuery method. 
- Now update our template. 
- Done! 
- Style it. 

- A warning! 
  - We've just removed it from the *view*... not the collection. 
  - We'll fix this later. 


# Our own custom events

- But we don't have to stick to the DOM events. We can have our own.
- A little contrived as an example, but hopefully you'll be able to see the point. 
- Let's make our gallery log whenever something gets added to it. In our Gallery class: 
  ```
  initialize: function() {
    _.extend(this, Backbone.Events); // Make event stuff available to us.
    this.on('added', function() { console.log("Added an image to this gallery."); });
  }
  ```

  And, in our Gallery add: 
  ```
  this.collection.trigger('added');
  ```
- Notice that we've added this on our Gallery itself, it's not going to propagate around our application. 
- We've told our collection to listen for an event.
- And we triggered it *outside that collection*, on the collection object. 


# Spreading events around our app

- A common backbone pattern is to use the Backbone.Events object itself as a 'dispatcher', a thing to share messages between components. 
- You might also call it an 'event bus'. 
  - You can 'broadcast' messages on this object, and anything that's interested can listen to them. 
  - This is known as 'publish/subscribe'. 
  - Another common pattern is to 'namespace' events with colons. 
    - No special meaning, just another character.
- Let's make our app listen for 'add' and 'remove' events on images, and make the gallery show and hide some helper text based on whether there are any images left. 

  - Add an EventBus object within our document.ready: `EventBus = _.clone(Backbone.Events);`
  - In ImageView.remove, trigger an 'image:removed' event on the EventBus. 
  - In GalleryView.add, trigger an 'image:added' event on the EventBus. 
  - Add a <p class="empty_gallery">No images in this gallery.</p> within our <ul id="demo_images">. 
  - In our GalleryView.initialize method, add: 
    ```
    var that = this; 
    EventBus.on('image:added', function() { $('.empty_gallery', that.$el).hide(); });
    EventBus.on('image:removed', function() { if (0 === that.$el.children('li').length) { $('.empty_gallery', that.$el).show(); }});
    ```


# Refactoring

- We've made a bit of a mess here. Let's clean it up. 
- We've got two events, 'added' and 'image:added'. Let's move that to be just one. 
- We don't need our tmpl_hello any more; remove it. 
- We stuck a p into a list... that's a bit stinky. 
  - Our galleries are getting a bit complicated. Let's make our GalleryView manage an entire div, that happens to contain a list. 
  - Let's do that by adding a template for it. 
    ```
    <script type="text/template" id="tmpl_gallery">
      <div>
        <h2>Photo Gallery</h2>
        <p class="empty_gallery">No images in this gallery.</p>
        <ul class="gallery_images"></ul>
      </div>
    </script>
  ```
  - Add a <div id="gallery_container"></div> to our page.
  - Update our CSS (#demo_images → .gallery_images)
  - Update our JS. 
    - GalleryView `el: '#gallery_container'`
    - render() function on GalleryView: 
      ```
      render: function() { 
        var my_template = _.template($('#tmpl_gallery').html());
        this.$el.html(my_template());
        return this; 
      },
      ```
    - update appendItem(): `this.$el.append` → $('ul', this.$el).append`
      


# Let's add gallery support.

- We've now got a system that lets us draw a gallery, and our images are already stored in a collection. 
- Wouldn't it be nice if we could have multiple galleries too? 
  - We'll need a new view that shows us the available galleries. 
- And there's a subtlety here...
  - We *could* try to just shove our Gallery Collection into another Collection...
  - ... But we probably want to have more than just a Collection of Collections. Each Gallery should probably have a title, for instance.
  - Or maybe we want an associated date-stamp, author, a description.
  - Let's rename things. We still have Images, and collect them into Albums. We can have many Albums in a Gallery. 
  - So, let's refactor our Gallery Collection into an Album Model, that *contains* a collection. 
  - And we'll have to update some of our other bits to suit. 

- Rename the Gallery to PictureContainer. 
- Create a new Album model:
  ```
  var Album = Backbone.Model.extend({
    defaults: {
        title: '',
        pictures: null
    },
    initialize: function() {
      this.set({pictures: new PictureContainer()});
    }
  });
  ```
- Update our GalleryView to work with our new Model, not a collection. 
  - Rename all occurrences of 'Gallery' to 'Album'.
    - And in lower case - CSS, HTML, selectors
  - Convert `this.collection = new PictureContainer()` to `this.model = new Album()` and update the binding accordingly. 
    - Collections raise an 'add' event automatically when something gets bound, but models don't, so we'll have to do that ourselves. `
  - Change `this.collection.add` to `this.model.add in our GalleryView. 
  - Add an `add()` method to our Gallery: 
    ```
    add: function(image) { 
      var pictures = this.get('pictures');
      pictures.add(image);
      this.trigger('add', image);
    }
    ```

- Right now we've got one form for the whole app; let's make it gallery-specific. 
  - Remove form from main page and put it into the Gallery template.
  - Change form ID to form class. 
  - Move events hash from AppView to GalleryView. 
  - Move addImage from AppView to GalleryView, and rename to 'addImageFromForm'. Update in the events hash too. 
  - Update `this.gallery.add` to `this.add` in our `addImageFromForm` method.

- Test it! This should work so far. 
  - But... removing an item shows our "no items" bit. 
  - Because .children() only traverses down one level. Change to .find().

- Let's build a view to show multiple galleries, and make our website show it by default.
  - Which means we'll need a new collection.
  - And a new template to go along with it. 

  - Add a Gallery collection and a view for it. 
    ```
    var Gallery = Backbone.Collection.extend({ model: Album });

    var GalleryView = Backbone.View.extend({ 
      tagname: 'div', 

      render: function() { 
        var my_template = _.template($('#tmpl_gallery').html());
        this.$el.html(my_template({albums: this.collection}));
        return this;
      }
    });
    ```
    - Nothing exciting here. We've seen this all before, right? 

  - Add a template: 
    ```
    <script type="text/template" id="tmpl_gallery">
      <h2>Available Albums</h2>
      <p>We have <%= albums.length %> <% if (1 == albums.length) { print("album"); } else { print("albums"); } %> in our gallery.</p>
      <ul>
        <% albums.each(function(album) { %>
          <li class="album" data-id="<%= album.cid %>"><img src="http://placehold.it/200x200" /><p><%= album.get('title') %></p></li>
        <% }) %>
      </ul>
    </script>
    ```
    - We're doing some more complex stuff in this template. 
      - We've got some logic, and are using Backbone's `print()` to produce some output. 
      - We're using .each on our collection to iterate over our objects. 
      - Each item is a Backbone Model, so we can call .get on it. 
      - Backbone models get a client ID property, called `cid`, that we can use to retrieve it from a collection later. 
      - This is kind of ugly, though. Beware! 

  - Rejig our AppView so it drops us on the Gallery list, and creates a gallery by default. 
    - Change our `initialize()` function to: 
      ```
      initialize: function() { 
        // Create a new gallery.
        this.gallery = new Gallery();
        var album = new Album({title: 'Bill Murray'});
        var image1 = new Image({title: 'Steve Zizzou', url: 'http://www.fillmurray.com/200/310'});
        var image2 = new Image({title: 'Venkman', url: 'http://www.fillmurray.com/205/320'});
        album.add(image1);
        album.add(image2);
        this.gallery.add(album);
        this.render();
      },
      ```
      - We set up some Backbone models, and then ask our App to display itself. 
      - And we're no longer calling `add()` on a View; we're calling it on a Model. The Model expects to get an Image model rather than two text fields. 
    - Add a `render()` method and a `showGallery()` function. 
      ```
      render: function() {
        this.showGallery();
        return this;
      },
      
      showGallery: function() {
        var galleryView = new GalleryView({collection: this.gallery});
        this.$el.html(galleryView.render().el);
        return this;
      }
      ```
      - We've created a `showGallery()` function that renders a new GalleryView, giving it the collection of Albums to show. 
      - We ask the galleryView we created to render itself, then got its content (remember, we did `return this` in it), and put that intou our view's HTML. 
      - Why not just do this in `render()`? That will soon become clear. 

  - So now we can view all the galleries in our app... but not the albums themselves. 
  - Let's add a `showAlbum()` method that shows an album. 
    ```
    showAlbum: function(album) {
      var albumView = new AlbumView({model: album});
      this.$el.html(albumView.render().el);
      return this;
    }
    ```
  - And add something in our GalleryView that broadcasts a 'display this album please' message to the world. 
    - Update GalleryView to have a `tagName: 'div'` in it, and remove the container from our HTML file. 
    - Add `events: {'click li.album': "showAlbum" }` to GalleryView.
    - Add this to GalleryView: 
      ```
      showAlbum: function(ev) { 
        var clickedItem = $(ev.currentTarget);
        var id = clickedItem.data('id');
        EventBus.trigger('display:album', this.collection.get(id));
      }
      ```
    - Our GalleryView doesn't know how to display an album! 
      - But it can broadcast a message saying "Please display an album!" 
      - And it can include the album it wants to display. 
      - And we get the album to display from the data attribute of the HTML element. 

  - Now, our AppView should listen for the request to display an album, and display it. 
    - In AppView.initialize(): 
      ```
      _.bindAll(this, 'showAlbum'); // so "this" refers to the AppView, not the album
      EventBus.on('display:album', this.showAlbum);
      ```


- Phew! That was a lot of effort, wasn't it? 
- Let's see some benefit by adding more sample data. 
  ```
  var album2 = new Album({title: 'kittens'});
  album2.add(new Image({title: 'Kitten!', url: 'http://placekitten.com/205/200'}));
  album2.add(new Image({title: 'Another kitten!', url: 'http://placekitten.com/205/320'}));
  this.gallery.add(album2);
  ```
  - And this is kind of neat; we've just created a couple of extra models, and our frontend has displayed it. And we can interact with these things. 
- Oh hey. Our 'no items' thing is still showing. 
  - Move the EventBus.on('image:added') code out of the initializer, and into the appendItem method (delete the EventBus handler).



- But here's another benefit. Let's add a menu so we can navigate around our various views. 
  - Add a MenuView.
  ```
  var MenuView = Backbone.View.extend({
        el: '#menubar',

        initialize: function() {
            this.render();
        },

        render: function() {
            var my_template = _.template($('#tmpl_menu').html());
            this.$el.html(my_template());
            return this;
        }
    });
    ```
  - Add a simple template. 
    ```
    <script type="text/template" id="tmpl_menu">
        <p>Photo Gallery &raquo;
        <% if (!album) { %>
            Albums
        <% } else { %>
            <a href="#" class="albums">Albums</a> &raquo; <%= album.get('title') %>
        <% } %>
    </script>
    ```
    - We're presuming here that we might pass in an album to our template; we haven't written that code yet. 
    - But when we do, we want to display its title in the navbar... and make the 'Albums' section a link. 
  - Make it render: add `var menuView = new MenuView()` as the last line in our `document.ready()` anonymous function.

  - So there's a couple of things we want to happen:
    - When the user views an Album, the nav bar should update.
    - When the user clicks 'Albums', the view should switch back to the Albums view, AND the nav bar should update. 

  - Part 1: update the nav bar when we view an album. In MenuView.initialize: 
    ```
    _.bindAll(this, 'render'); 
    EventBus.on("display:album", this.render);
    ```
    - So we'll re-render the menu whenever we display an album. But our view expects to get an album passed to it. Update render to: 
      ```
      function render(album) { 
        var my_template = _.template($('#tmpl_menu').html());
        this.$el.html(my_template({album: album}));
        return this; 
      }
      ```
    - And that part should now work! Let's test it. 

  - Part 2: switching back to the Albums view. 
    - Pretty easy; stuff we've done before. 
    - Add to our MenuView: 
      ```
      events: {'click a.albums': 'showGallery'},
      showGallery: function(ev) { 
        ev.preventDefault(); 
        EventBus.trigger('display:gallery');
      }
      ```
    - Update our AppView's initialize to listen for 'display:gallery'.
      - Add showGallery to our bindAll.
      - Add `EventBus.on('display:gallery', this.showGallery)`.
      - Add 'display:gallery' to our EventBus.on in MenuView.initialize.
    - Test it; we should now be able to switch back to the gallery from the nav bar, and the nav bar should update (as well as the page). 

- So we're building up these little components that each do one thing, and listen for stuff they care about, and behave accordingly. 
  - Our app is a little complicated when viewed 'zoomed out', but each of these components is looking after one thing. 


- Let's improve our nav, and make it more dynamic. Let's make the menu bar display how many images are in the gallery. 
  - Add `(<%= album.size() %>)` to the end of our Album name in our template. 
  - Add a size() method on our Album model: `size: function() { return this.get('pictures').length; },`
  - Hit refresh: it'll change. 
- Now let's make it update whenever our gallery changes. 
  - Add 'image:added' to our EventBus.on in MenuView.initialize to make it refresh every time we add an image. 
  - Make sure we send an image along with the image:added event: in AlbumView.add() update EventBus.trigger to `EventBus.trigger('image:added', this.model)`. 
  - Test it: the picture count should update whenever we add an image to our gallery. 
- Now, though, we're going to find a bug in our 'remove'. 
  - When we click the 'remove' button, we're removing it from the DOM, but not from our collection. 
  - We want to remove it from the collection now, because we're updating the count from the collection itself. 
  - And to destroy the object itself. 
  - Let's start by adding a data-id on the remove span: `<span class="remove" data-id="<%= id %>">X</span>`
  - And add the ID to the parameters passed through in ImageView.render(): `this.$el.html(my_template({title: this.model.get('title'), url: this.model.get('url'), id: this.model.cid}));`
  - Now is a tricky part: you know how events bubble in the DOM? They bubble in Backbone, SOMETIMES. 
    - Not always. 
    - But they do bubble up to parent views. 
    - We'll get our Album view - the one that shows all the photos - to handle the removal. 
      - Add `'click .remove': 'remove'` to the AlbumView events object and remove it from the ImageView. 
      - Delete the remove method from the ImageView. 
      - Add 'remove' to the list of bindings in AlbumView.initialize.
      - Add a remove function to AlbumView: 
        ```
        remove: function(ev) {
          var id = $(ev.currentTarget).data('id');
          this.model.remove(id);
          EventBus.trigger('image:removed', this.model);
          this.render();
        }
        ```
        - This calls 'remove' on the Album Model, passing it the ID, and triggers the 'image:removed' event.
        - And then asks the AlbumView to re-render itself. 
      - Add a 'remove' function to the Album.  
        ```
        remove: function(id) {
          var pictures = this.get('pictures');
          var picture = pictures.get(id);
          pictures.remove(picture); // Remove the picture from the collection
          picture.destroy(); // Destroy the model, make Backbone forget about it. 
        },
        ```
      - We can remove the Event.on('image:removed') in the ImageView that shows the help text for an empty album! 
        - It gets displayed by default, and removed when we append an item. 
        - And we're re-rendering whenever we remove an item. 


# Routing



