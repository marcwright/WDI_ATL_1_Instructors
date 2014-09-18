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

## Models

- This is supposed to be a photo gallery, and we've got a basic proof of concept up that shows we can update our HTML from Backbone. 
- Let's add an image. 
  - We're going to create an Image model, and an associated view for it. That is, a way to render one image. 
  - We're also going to create a Collection - something to hold our images. 
  - Then we're going to create a view for our collection. 
  - Our collection will then draw a new image whenever we add an image. 

- Create the model, and its view. 

  ```
  Image = Backbone.Model.extend({
    defaults: {
      title: '',
      url: ''
    }
  });

  ImageView = Backbone.View.extend({
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
  Gallery = Backbone.Collection.extend({
      model: Image
  });

  GalleryView = Backbone.View.extend({
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

- POORLY PLANNED INTERSTITIAL ALERT
  - If you add a `tmpl_flash` template and a FlashView View, you can do some nice CSS to style it, with some jQuery slideUp/slideDown to show/hide it and make the FlashView listen for image:added and image:removed.
  - Which lets you talk about the encapsulation and how the FlashView doesn't know anything at all about the rest of the app.
  - And you can do a short lab where they add a FlashView to their own addressbooks. 


- BACK TO OUR REGULARLY SCHEDULED PROGRAMME
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
      - We ask the galleryView we created to render itself, then got its content (remember, we did `return this` in it), and put that into our view's HTML. 
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
    - This won't work as-is; our `AlbumView.render()` doesn't draw the li elements (that gets delegated to appendImage, which is no longer being called).
      - It's no longer being called because we're giving our AlbumView an album directly. 
      - Easy fix is to call appendItem for each item in our list: in `AlbumView.render`, after we updated our `this.$el.html`...
        ```
        var that = this;
        _(this.model.get('pictures').models).each(that.appendItem, this);
        ```
        - `this.model` is an Album. 
        - `this.model.get('pictures')` gets us a PictureContainer. 
        - .models on a Backbone container gives us the models contained within it. 
        - We're iterating over these with Underscore's `each`, and calling appendItem for each one. 


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


## Lab opportunity: refactor their addressbook so it supports multiple categories. 
- You can add the same model to multiple collections! 







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

- So far, we've managed our app's state ourself. 
- We've added click handlers to things, and made our app state update accordingly. 
  - But this is kind of the boilerplate that we'd like our library to handle for us. 
  - And if we wanted to send someone a link to a specific album, we couldn't do it. 
- We can use Backbone's routers to handle this for us.

- So let's do that: let's add a static renderer first of all, just as a demo. 
  ```
  var AppRouter = Backbone.Router.extend({ 
    routes: {
      "": "index",
      "about": "about"
    }, 

    index: function() { 
      EventBus.trigger('display:gallery');
    },

    about: function() { 
      EventBus.trigger('display:about');
    }
  });

  var appRouter = new AppRouter();
  Backbone.history.start();
  ```
  - Defining a new router, that knows about two actions. A blank one, by default, and one to show an 'about' page. 
  - Starting the AppRouter, and telling Backbone to start routing things. 
  - Why history.start()? Because the docs say so. 

- We need to connect up a couple of other bits, though; get our AppView to respond to 'display:about'. 
  ```
  showAbout: function() { 
    this.$el.html("<h3>All about my photo gallery</h3><p>This is a simple photo linkblog. Like pinterest, but mine.</p>");
    return this; 
  }
  ```
  - And in AppView.initialize: 
    ```
    _.bindAll(this, 'showAlbum', 'showGallery', 'showAbout');
    EventBus.on('display:about', this.showAbout);
    ```
- Now: add '#about' to our URL. About should show! 
  - Remove it! It'll disappear! Magic! We'll see the gallery view instead!
  - No page reload: it's a hash slug, so we're not reloading the page. But we could send someone a direct link to it...

- Neat! Let's do it with parameters. 
  - So we can view specific albums. 
  - Add to our routes: `"albums/:id": "showAlbum"`
  - Add a new method to our router: 
    ```
    showAlbum: function(id) { 
      // ...
    }
    ```
    - Augh! 
      - We're going to get a numeric ID into our `AppRouter::showAlbum()`, and we'd like to raise an event to say 'show this album'...
      - ... but our 'display:album' method is expecting an album as a payload, and our AppView doesn't know anything about the albums.
      - ... So let's refactor it so that our display:album event contains an integer as a payload instead. 
    - Refactoring: 
      - update our `EventBus.trigger` to transmit the ID, not the entire album. 
      - update our `showAlbum` method on `AppView` to be `showAlbum: function(albumId) {`
      - Add the line `var album = this.gallery.get(albumId)` as the first line. 
      - Update `MenuView::render()` to be `function render(albumId)`.
      - Refresh! 
        - Error... 'album' is not defined, from our MenuView. 
        - Add a `var album = null` in our `MenuView::render`. 
    - We have a refactoring quandary. 
      - Our original goal is to support navigation via routes. 
      - And that meant that our event should be broadcast with an ID, not an Album object. 
      - But now our Menu doesn't have an Album, so it can't display the name and the number of images. 
    - So what could we do? 
      - We could re-write the event whenever it hits something that knows about albums: broadcast it with an integer initially, and re-broadcast it with an Album afterwards. 
        - Kinda stinky
        - Kinda brittle
        - Relying on slow human reaction times - we're drawing the menu twice each time. 
      - We could broadcast a *different* event, like 'updateMenu', that includes an album. 
        - Kinda stinky
        - One of the reasons we like event broadcasts is that it reduces coupling - our app doesn't have to know there's a menu bar being shown - and we're reintroducing that tight coupling. 
      - We could abandon this event-driven approach, and put everything into our AppRouter.
        - Kinda stinky
        - Giant 'God Objects' is what's known as an antipattern - something to be avoided. Easy to develop 'big balls of mud' - giant classes that try to do everything, when we want small pieces loosely joined. 
      - We could give our Menu a way to say "Can something give me the album with ID x, please?" 
        - Kinda stinky
        - Our objects are currently all independent, broadcasting messages out into the ether
        - We don't really want to have to introduce a tight coupling to it.
        - And our objects now might care about their instantiation order. 
      - We could make our AppView render the MenuView, and pass it the album it needs to render. 
        - Kinda stinky
        - We've made our AppView bigger, and it's already doing a lot. In danger of becoming a God object. 
        - And if all our Router is doing is broadcasting a 'Display item BLAH' message and the AppView is just listening for it, AND it's going to tell the menu to update, why bother with it at all? 
    - There is no right answer
      - It's down to personal taste
      - It's down to personal experience
      - It's down to the trade-offs in your app. 
      - And all of them have drawbacks. 
    - I think the last one is the best.
      - The AppView is kind of responsible for looking after everything, after all...
      - I could also be tempted by making the AppRouter our God object. 
        - Or at least being a bit more involved in things, rather than just firing off events. 
        - I might change my mind later! That's OK too. 
          - Mind like water; we shouldn't be afraid to change our code once it no longer fits. 
          - Good writing is re-writing; good code is refactoring. 
          - The only way to find out what the right way to code something is is to code it as best as you can and constantly ask yourself if you're on the right track. 
          - I'd rather write something quickly and re-work it 3 or 4 times than spend days trying to figure it out. 
          - But do think before you start!
    - I am going to fix this in a stinky way, because we've already done a bunch of refactoring today. 
      - The simplest possible way is to give the MenuView a copy of the AppView, and let it ask the AppView "Hey, can I have the model with id X, please?" 
        - Add a call to `menuView.setAppView(appView)` after we instantiate the views at the end. 
        - Add a `getAlbumById: function(id) { return this.gallery.get(id); }` to our appView.
        - Add `getAlbumById` to the bindAll call in our AppView.
        - In our MenuView::render(), add `var album; if (albumId !== undefined) { album = this.appView.getAlbumById(albumId); }`. 
        - add a `setAppView: function(appView) { this.appView = appView; }` to our MenuView. Add it to our `bindAll` in `initialize` too. 
  - So let's hit refresh! 
    - Our menu works again. Yaaaaay. 
    - Let's get back to our routing. It should be pretty easy after this. 
    - We'd added it to our router's routes hash, but we didn't finish our event trigger. 
      ```
      showAlbum: function(id) { 
        EventBus.trigger('display:album', id);
      }
      ```
      - Our parameter that we defined in our route was passed into our showAlbum function. 
      - The name is just convention; Backbone will pass parameters in in the order that we specified them. 
      - Naming is for humans, not for Backbone. 
    - Let's test! 
      - My albums have an id of 'c2'. So if I add `#albums/c2` to the end of the URL, and hit refresh, it works! 
    - So what does this mean? 
      - It means we can REMOVE SOME CODE. 
        - YAAAAAAAAY
      - Wrap the contents of our `<li>` in our image template in an a tag: `<li class="album" data-id="<%= album.cid %>"><a href="#albums/<%= album.cid %>"><img src="http://placehold.it/200x200" /><p><%= album.get('title') %></a></p></li>`
      - Remove the `events` hash in our GalleryView.
      - Hit refresh, and it should all JUST WORK when we click on our albums. 
      - So we don't need `GalleryView::showAlbum` any more - and now we don't need our `initialize` function either. 
      - And we can do the same for our `MenuView`: remove the `events` hash, and remove the `showGallery` function too. 
    - Git commit
      - What a satisfying changeset! 
      - Any changeset where we remove code and our app still works fine is probably great. 
    - A couple of quick notes...
      - Our router emits events automatically for us with the name of the route. 
        - So if our AppView had access to our router, we could do `router.on('route:about', function() { /* ... */ });` instead of using our event bus. 
        - I don't know if you get parameters with this, but I expect so. Experiment! Read the docs!
      - Catch-all routes: wildcards. 
        - We could use this in our apps to make more general-purpose routes...
        - ... But we're going to use it to make a "404" page. 
          - Add to our routes: `"*stuff": "show404"`. 
          - Add a new method to our router: `show404: function(stuff) { EventBus.trigger('display:404', stuff); }`
          - Add a template: 
            ```
            <script type="text/template" id="tmpl_404">
              <h2>404 Not Found</h2>
              <p>You tried to access <%= stuff %>, but our app doesn't know how to display it. Sorry.</p>
            </script>
            ```
          - Add a method to render it, and an EventBus.on, to our appView.
          - Even if we go to something with slashes in it, we get the whole path in.



## An opportunity for a refresher
- It's possible there were a few days between the last lesson and this one. Here are some questions for review with the class.
- What is Backbone? What's it for? 
  - It's a library/framework. It gives us the ability to structure our code and stops us having to write a bunch of boilerplate. 
  - And in the same way as we can have 'smarter' stuff in our Ruby rather than trying to do everything with arrays and hashes, it lets us have more complex objects.
- What objects does Backbone give us? 
  - Model, Collection, View, Router, Events.
- How were we doing templating? 
- Is Backbone more like Sinatra or Rails? 
  - I'd say Sinatra, because it's giving you some tools that take shortcuts rather than a whole bunch of infrastructure, generators, and strong conventions. 
- What's an event bus? 
- That photo gallery we were building. What's in it? 
  - Gallery, Album, Image.
  - How did they connect together? 


## Rails! 
- So far, we've worked just in the browser. 
  - Which was kind of neat in itself! 
  - We've made an app that has a bunch of small components that co-operate. 
  - But they don't have close ties to each other, which helps us build complex apps. 
- Contrast this to the apps we've built in the past that just work on the server.
  - The server-only apps felt a bit static...
  - ... And our client-only app felt a bit like a toy.
    - Not to mention it's an accessibility nightmare. 
  - Let's get them to co-operate! 
- The app we're going to build today is JUST going to act as an API for our Backbone app.
  - Which means it's just going to return JSON. 
  - Is that progressive enhancement or graceful degradation? 
    - Neither! 
    - It's "Go fuck yourself if you don't have JavaScript!"
      - Fuck off, crap mobile browsers! 
      - Fuck off, people on flaky wifi! 
      - Fuck off, person who loaded the site when we had broken code live! 
      - Fuck off, people with screen readers! 
      - Fuck off, text browsers! 
      - Fuck off, search engines! 
      - Etc. 
    - But... sometimes this is OK.
      - Proof of concept
      - Lets us prototype quickly.
      - Add a web layer to a mobile app
      - Internal company apps.
- So, what models do we have in our Backbone app right now? 
  - Image, Album, Gallery
  - So if we wanted to save this stuff to the server, what would we want? 
    - Definitely Image and Album, and Album has_many Images. 
    - But... maybe skip Gallery for now? 
      - We only have one.
      - It depends what we're building! 
      - If we were going to have user accounts, then maybe we wouldn't skip it. 
        - We'd have a User model on the backend, and our User would has_one Gallery. 
      - But we're just building a demo project, so we'll skip it. 
- So, let's build ourselves a simple Rails app. 
  - git status # Working directory clean
  - rails new galleryserver
  - git add galleryserver
  - git commit -m "New, empty Rails app."
  - cd galleryserver
  - Generate some models: 
    - rails g model album title:string
    - rails g model image title:string url:string album:references
    - Add `has_many :images` to app/models/album.rb
    - Let's add some seed data.
      ```
      animals = Album.create(title: 'Cute Animals')
      lols = Album.create(title: 'Lols')
      wut = Album.create(title: 'Wut')
      animals.images.create(title: 'Ferret', url: 'http://i.imgur.com/3e2khf9.jpg')
      animals.images.create(title: 'Gerbil', url: 'http://i.imgur.com/a1zDQWb.gif')
      animals.images.create(title: 'Raccoon', url: 'http://i.imgur.com/bEKHNj1.gif')
      animals.images.create(title: 'Pokemon', url: 'http://i.imgur.com/9HBrTit.gif')
      wut.images.create(title: 'Leeloo', url: 'http://i.imgur.com/zDJU8Be.jpg')
      wut.images.create(title: 'Tongue', url: 'http://i.imgur.com/psIOBE3.gif')
      wut.images.create(title: 'Ducks', url: 'http://i.imgur.com/swhxh17.jpg')
      ```
  - Generate controllers: 
    - rails g controller albums index show -e none
    - rails g controller images show create -e none
    - Remove the routes created in config/routes.rb and add `resources :albums, :images, defaults: {format: :json}` instead
      - The format: :json bit says we want to return JSON by default. 
    - Let's start with the images. Edit app/controllers/imagecontroller.rb: 
      ```
      class ImagesController < ApplicationController
        respond_to :json
        
        def show
          @image = Image.find params[:id]
          respond_with @image
        end
              
        def create
          @image = Image.new params[:image]
          if @image.save
            respond_with @image
          else
            respond_with @image, :status => :unprocessable_entity
          end
        end
      end
      ```
      - Class-level respond_to says we'll be responding to json, either via /images or /images.json.
      - In show, we get an image, and return it to our requester. 
      - In create, we try to create an image. If it succeeds, we return it. Otherwise we return it with an appropriate status. 
  - That should be everything in terms of our JSON serving for images. But we want to serve our app from our Rails server too. 
    - If we try to run it locally, then we will run into a thing called CORS, and it will really fuck up your day. 
      - Browsers have a thing called the same-origin policy, which stops them making requests to other domains. 
      - Sometimes that would be useful, like this time, when we have local files we want to talk to on the wider network. 
      - But otherwise, if code on one site could reach across to another, then if you went to a website while you were logged into Facebook...
      - ... it could do anything to your Facebook account it wanted. Create messages, read private messages, read your password when you typed it, steal your login cookies...
      - ... or do this to your bank...
      - This is why XSS - Cross Site Scripting - is a common class of security holes. It's allowing an attacker to run their code on your site, which would normally be prevented by the same-origin policy.
      - CORS is a way of relaxing these rules. A way of saying "Dude, it's cool, I'm an API. JavaScript can totally make requests to me."

  - Anyway. Let's serve our content from our Rails app. 
    - rails g controller static index
    - add `root to: "static#index"` to our config/routes.rb
    - rm public/index.html
    - rm app/views/layouts/*
    - cp ../example/index.html app/views/static/index.html.erb
    - Replace all the OPENING <% TAGS ONLY WITH `<%%` to stop erb fucking them up
      - NOT THE CLOSING TAGS
    - Replace our stylesheet and CSS loads with calls to stylesheet_link_tag and javascript_include_tag
      - And copy those files into our app/assets
    - Visit http://localhost:3000 after starting the server... Should all work!

## The backbone bit
  - DO NOT FORGET THAT WE HAVE CHANGED FILES. WE COPIED OUR FILE TO app/assets/javascripts AND WE SHOULD EDIT THAT ONE NOW. 
  - ANOTHER LURKING FUCKUP: IF YOU LEAVE THE `#albums/3` BIT ON YOUR URL EVERYTHING WILL BREAK. 
  - Go back to Backbone. How do we do syncing in Backbone? 
    - It's pretty straightforward, actually. If we're dealing with a base case. 
      - Sadly, we're not. :(
      - Also, the documentation straight-up sucks. 
      - No good examples. 
      - Welcome to Stack Overflow. Population: you. 
    - If we were, we could just define some URLs on our Collections, and pretty much everything would be tickety-boo.
  - Let's start by getting our images from the server, instead of creating them by hand. 
    - Add a urlRoot attribute to our Image model: `urlRoot: '/images'`
      - Backbone understands REST
      - So it will try to do a '/images/1' to get the first image
      - And try to POST to /images to create new stuff. 
    - Update our AppView.initialize() to remove our hard-coded images, and get some specific ones from the server instead. 
      ```
      var image1 = new Image({id: 1});
      var image2 = new Image({id: 2});
      image1.fetch();
      image2.fetch();
      album.add([image1, image2]);
      ```
      - We're calling .fetch() to say "Hey, Backbone, go get the latest version from the server."
      - And we can add more than one in one go by passing an array to album.add. No biggie. 
    - Hit refresh... should work! 
  - What about saving our images? 
    - Where are we creating our images? (AlbumView::add())
    - Add an image.save() there.
    - Now if we create one from our form... it gets saved! 
      - But not into our album. Yet. We haven't taught our Backbone app OR our server about albums.

  - So we can retrieve individual images from our Rails app. What about our albums? 
  - We're going to need a controller that's pretty similar.
    - Edit app/controllers/albumcontroller.rb: 
      ```
      class AlbumsController < ApplicationController
        respond_to :json

        def index
          @albums = Album.all
          respond_with @albums
        end

        def show
          @album = Album.find params[:id]
          respond_with @album, :include => :images # Miss off the :include first, we'll explain it below. 
        end
      end
      ```
      - respond_to :json says "This controller is returning JSON only." 
      - respond_with in each action says what we want to return. 
      - We want to include our images as a nested attribute inside our album. Show it without the include first. 
      - Test with curl: 
        - curl http://localhost:3000/albums
        - curl http://localhost:3000/albums/1
        - You MIGHT be able to pipe these to json_reformat, if you're lucky. 
          - See also http://www.quilime.com/code/osx_print_json for OSX
        - Our app will also respond to /albums.json and /albums/1.json, if you don't like the idea of a web service that returns JSON by default.
          - Or if you wanted to render an HTML version. Hint, hint.
  - Our Rails app is done for now!
    - What does this mean? Git commit.
      - Don't need the assets for it, or the helpers. Fuck 'em. Delete 'em. 

  - Let's teach Backbone about our albums. 
    - Add a `urlRoot: '/albums'` to our `Album` model.
    - Add a `url: '/albums'` to our `Gallery` collection.
      - Our Gallery is a collection of albums, remember? 
      - Update our AppView.initialize to be `this.gallery = new Gallery(); this.gallery.fetch()`
    - Hit refresh! It's broken! 
      - Why is it broken?
      - Because are rendering before we get any data back from the server. Asynchronous! 
      - Update our fetch to be `this.gallery.fetch({success: this.render })`
        - We added a callback, just like in a normal AJAX request. 
        - Make sure render is included in our _.bindAll.
    - But... it's still kind of broken... click an album. They're all empty. 
      - Backbone collections can auto-populate their models for us. But an Album isn't a Collection, it's a Model. 
      - So we can't just hit an endpoint that pulls down stuff and it'll auto-populate. 
      - We *could* try to handle this manually...
        - We could set a flag on our album model that tells whether it's tried to get the images for the album yet.
        - And then retrieve them ourselves if we haven't. 
          - Remember we built in those details with our album call? 
          - We get a `.parse()` method in our Backbone models that we can override that controls how our JSON gets converted to models. 
      - But let's let Backbone do most of the work for us, this time. 
    - Our Album model contains an ImageContainer collection. Let's teach it to retrieve our images for us. 
      - Via the #show method on the Album model. Which means it needs to know the ID of the album. 
      - Thus, update the initialize method of our Album model to: 
        ```
        initialize: function() {
          var container = new ImageContainer();
          container.id = this.id;
          container.fetch();
          this.set({images: container});
        },
        ```
      - Our Albums are always being initialized by gallery.fetch(), so they'll always have an ID by this point. 
      - And tell our ImageContainer where its endpoint is on the server: 
        ```
        url: function() { 
          return "/albums/" + this.id;
        }
        ```
      - Let's review what we get back from our server: `curl http://localhost:3000/albums/1`
      - Our Collection is expecting to get back a JSON array containing Image objects. Is that what we get? 
        - No! 
        - We get the Album data too. 
      - Add a `parse` method to ImageContainer: 
        ```
        parse: function(data) { 
          return data.images;
        }
        ```
      - That's it! 
      - Our albums now construct correctly. 

  - What about image creation and deletion? 
    - Let's try to create an image. What happens? Does it work?
      - It shows up in the page...
      - ... and our rails console shows it saved it. 
      - So did it work? NO! No album_id. 
    - Backbone doesn't do relationships for us automatically. 
    - How are we going to fix this? (This is a good question to ask the class.)
      - We need to set our album_id. 
      - add album_id to our attr_accessible line in app/models/image.rb
      - Where in Backbone? Where are we creating our Image models? (This is a good question to ask the class.)
        - It's in our AlbumView, an add method. 
        - We could just add an `image.set('album_id', this.model.id)` to our AlbumView add method...
        - (Go ahead and add it, prove that it works)
        - But we're being a bit stinky. A View instantiating a new Model? Really? 
        - Let's move the add method out of AlbumView and into Album.
          - Move the method from AlbumView to Album, remove it from _.bindAll in the AlbumView initializer.
          - Rename it to 'addNew'
          - update calls to 'this.model' to 'this'
          - update call in AlbumView::addImageFromForm from `this.add($titleInput.val(), $urlInput.val())` to `this.model.addNew($titleInput.val(), $urlInput.val())`. 
        - We're no longer using our Album::add, but let's update it so we can work with it anyway. 
        - Add `image.set('album_id', this.id); image.save()` to our Album::add method. 
          - Backbone calls `model.isNew()` to determine whether to hit 'create' or 'update'.
      - Check it still works, git commit. 
    - What about deletion? 
      - [Did you skip over the section about deletion above, because of time constraints?]
      - What happens if we click the X button?
      - The Image's destroy() method gets called, which will automatically try to delete it on the server. 
      - We haven't implemented delete yet. Let's do that. 
      - In app/controllers/image_controller.rb: 
        ```
        def destroy
          @image = Image.find params[:id]
          if @image.destroy
            respond_with :status => :no_content
          else
            respond_with @image, :status => :internal_server_error
          end
        end
        ```
        - :no_content maps to an HTTP 204, "No Content". 2xx, so success. It's a delete, so nothing to send back. 
      - That should now work! 

### Lab opportunity
- Go get your Addressbook, and connect it to Rails. 
  - Your app is simpler: you've not got categories, so you just need a Contact model. 
  - You can instantiate your collections straight from your index action; the Backbone docs might help you here. 
- Create a new Rails app
  - Add a Contact model
  - Add a Contact controller
  - Make the controller return some simple JSON 
  - Test it with Curl
  - Tell your Backbone objects their URLs
  - See if you can get it to load a static object. 
- CRUD
  - Add actions on your Contact controller for saving and deleting
  - Make sure the changes get replicated to your Rails server. 


### Bootstrapping our app with JSON data

- Bootstrapping our app (and removing an extra AJAX call and fixing that routing error, for funsies)
  - We've seen a consistent error in our app, if we leave our routing intact: "Uncaught TypeError: Cannot call method 'get' of undefined". Where's it from? 
    - Chrome tells us it's in our album render. 
    - So which bit is undefined? (this.model... we can console.log to prove it). 
    - Where does this.model get set? Or: what's trying to render this AlbumView at all? (it's in the AppView::showAlbum call). 
    - We've got a race condition in our code. 
    - Our code starts an AppView, which creates a new gallery, and calls fetch on it. This returns *immediately* - it doesn't wait for the data to come back. 
    - Then we start our AppRouter... which sees the URL slug, and fires off a 'display:album' event before our galleries have loaded. 
    - So when we call `this.gallery.get(id)`, there's nothing in there with an id yet. Our galleries are still empty because our server hasn't returned the data. 
  - Let's side-step this bug for a second, and look at the network inspector. 
  - When we hit refresh, what do we see? 
    - A request for the actual page, sure. And some asset loads. 
    - But then... some JSON requests?!? (I had 4). 
    - So to load our page, we're no longer doing 1 request, we're doing 4? WTF? 
    - It's because our AppView calls fetch() on the Gallery, which creates new Albums, each of which call fetch() on their ImageContainers. 
  - And if you look closely when you hit the front page of our app, you can see it switch from "0 albums" to "3 albums". 
  - We can fix this problem with the gallery not existing yet, AND fix these 4 AJAX calls, by 'bootstrapping' our app with JSON.
    - [If you've refactored your app into a module, add a `myApp.init` function along these lines: 
      ```
      init: function(data) { 
        new myApp.Views.AppView(data);
        new myApp.Routers.AppRouter();
      }
      ```
      - And add this to your `app/views/static/index.html.erb` file:
        ```
        <%= javascript_tag do %>
          myApp.init(<%= @data.to_json %>);
        <% end %>
        ```
    - [If you haven't refactored,] let's start by getting the data into our page. 
      - In our `app/controllers/static_controller.rb`, add `@albums = Album.all` to our `index` action.
        - Maybe StaticController was a crap name! It's no longer static!
      - And let's add it into our page, after including our gallery script.
        ```
        <%= javascript_tag do %>
          var albumsData = <%=raw @albums.to_json :include => :images  %>;
        <% end %>
        ```
        - raw says to Erb, "Don't escape this content."
        - :include includes it in our JSON response. We can demonstrate this without it too. 
        - And overall, we've stuck a variable 'albumsData' into our global scope, that contains our data from our server. 
    - Now we need to use that when we load our page instead of doing a fetch() call.
      - Comment out all of the .fetch() calls, so we know we're not using AJAX to load our models. We're now creating an empty gallery on startup.
      - Let's add an initFromData() method to our AppView, that creates new Albums from our initial JSON:
        ```
        initFromData: function(data) {
          var that = this;
          _.each(data, function(item) {
            that.gallery.add(new Album(item));
          });
        },
        ```
        - Call it after our new appView at the end of our file: `var appView = new AppView(); appView.initFromData(albumsData);`
        - We're using underscore's .each to loop over the items, and for each one construct a new gallery. 
        - Hit refresh! 
          - We can see our albums on the page!
          - There's no call to our albums endpoint via AJAX! 
          - If we leave that URL slug in, we no longer get errors! (Because the data exists when our router fires.)
        - But we've not loaded the albums themselves.
      - [I suspect there's a more Backbone way of doing this next bit] let's add a similar initFromData method on our albums.
        - Add an album.initFromData function: 
          ```
          initFromData: function(imageData) {
            var images = this.get('images');
            _.each(imageData, function(image) {
              images.add(new Image(image));
            });
          },
          ```
        - Update our AppView::initFromData function: 
          ```
          initFromData: function(data) { 
            _.each(data, function(item) {
              var album = new Album(_.pick(item, ['id', 'title']));
              album.initFromData(item.images);
              that.gallery.add(album);
            });
          },
          ```
        - Done! 
        - But... Backbone lets us instantiate a collection straight from a bunch of JSON.
        - We can replace our Album::initFromData function with: 
          ```
          initFromData: function(imageData) { 
            var images = this.get('images');
            images.add(imageData);
          }
          ```
    - Done! 

## Lab suggestion
- If you want, you can get them to do this with their Address books. 
- Editing an image hasn't been covered; you an just have a click event on the image details that replace it with an input field, and a listener for lost focus, that save it. 
  - You'll need to add an update method on the controller though. 
