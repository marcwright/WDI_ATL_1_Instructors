starting point - `index.html`

    <!doctype html>
    <html>
    <head>
      <title>Backbone</title>
      <script src="js/jquery-1.11.0.js"></script>
      <script src="js/underscore.js"></script>
      <script src="js/backbone.js"></script>
    </head>
    <body>
      <h1>My first backbone app</h1>
    </body>
    </html>


js console - test that all the libraries are loaded 

    $
    =>  function ( selector, context ) {
          // The jQuery object is actually just the init constructor 'enhanced'
          // Need init if jQuery is called (just allow error to be thrown if not included)
          return new jQuery.fn.init( selector, context );
        } 

    _
    =>  function (obj) {
          if (obj instanceof _) return obj;
          if (!(this instanceof _)) return new _(obj);
          this._wrapped = obj;
        } 
    Backbone
    =>  Object {VERSION: "1.1.2", $: function, noConflict: function, emulateHTTP: false, emulateJSON: false…}


`index.html`
    
      <script  src="js/application.js"></script>

      <div id="app_container">
        <p>Please wait... application loading</p>
      </div>

`application.js`
You could start with an `alert('hello');` to check it works...
Then add the Backbone setup..

    $(document).ready(function() {
      var AppView = Backbone.View.extend({
        el: '#app_container',

        initialize: function() {
          alert('yay! for backbone!');
        }
      })

    });

Nothing should change in the browser... no errors either though...    
    
in `document.ready`

    var x = new AppView();

Now we see the alert...

Replace the `alert` and add a `render` function:

    initialize: function() {
      this.render();
    },

    render: function() {
      this.$el.html('Application loaded.... Hello World!');
      return this;
    }



Add a template to the `index.html` head:

    <script type="text/template" id="tmpl_hello">
      <p>Hello, <%= name %></p>
    </script>

Update the render function:

    render: function() { 
      var my_template = _.template($('#tmpl_hello').html());
      this.$el.html(my_template({name: 'Alex'}));
      return this; 
    }


Make more dynamic:

    getName: function() { 
      var names = ["Alex", "Tim", "Clem", "Andy"];
      return names[Math.floor(Math.random() * names.length)];
    },

    render: function() { 
      var my_template = _.template($('#tmpl_hello').html());
      this.$el.html(my_template({name: this.getName()}));
      return this; 
    }

Even more dynamic:

    // backbone view option
    events: {'click button#redraw': 'render'},

    // in `tmpl_hello` template
    <button id='redraw'>redraw</button>



Adding Backbone models, and their views:

    // `application.js`
    var Image = Backbone.Model.extend({
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

    var Gallery = Backbone.Collection.extend({
        model: Image
    });

    var GalleryView = Backbone.View.extend({
        el: '#demo_images',

        initialize: function() {
          this.collection = new Gallery();
          this.collection.bind('add', this.appendItem, this); // only write this line after we've written the `appendItem` function...
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


    // `index.html`
    <ul id="demo_images"></ul>




Make a form to create new elements:

    <form id="add" action="#">
        <label for="title">Title</label><input id="title" name="title" placeholder="Your image's title" />
        <label for="url">URL</label><input id="url" name="url" placeholder="http://www.example.com/picture.jpg" />
        <input type="submit" value="Add" />
    </form>


Add an events property and an 'addImage' method to our AppView in `application.js`

    events: {'submit form#add': 'addImage'}

    initialize: function() {
      _.bindAll(this, 'setGallery');
      this.render();
    },
 
    setGallery: function(gallery) {
      this.gallery = gallery;
    },

    addImage: function(ev) {
        ev.preventDefault();
        var $titleInput = $('#title');
        var $urlInput = $('#url');
        this.gallery.add($titleInput.val(), $urlInput.val());
    }


    appView.setGallery(gallery);


Tidy the form at end of `addImage` (should be able to use `reset()` too...):

    $titleInput.val('');
    $urlInput.val('');


tmpl_image

    <span class='closebutton'>x</span>



    .closebutton {
        margin-right: 0.3em;
        float: right;
        font-weight: bold;
    }


Add an event handler to the `ImageView` and a function to run:

    events: {'click .closebutton': 'remove'}

    // the `remove` function is there by default, but if you want to do anything more, you might want to create your own
    remove: function() { 
      this.$el.remove();
    }


# day 2

Make our Gallery log everytime that an item is added:

    initialize: function() {
      _.extend(this, Backbone.Events); // Make event stuff available to us.
      this.on('added', function() { console.log("Added an image to this gallery."); });
      }

    // in `Gallery.add()` function
    this.collection.trigger('added');


Add an EventBus object within our document.ready: 

    EventBus = _.clone(Backbone.Events);


    // in `ImageView.remove()` function
    EventBus.trigger('image:removed');


    // in `Gallery.add()` function
    EventBus.trigger('image:added');

    // at end of code (inside document.ready)
    EventBus.on('image:added', function() { console.debug('saw an image:added event on the bus'); });
    EventBus.on('image:removed', function() { console.debug('saw an image:removed event on the bus'); });


Show this working with a simple template:

    // index.html
    <script type="text/template" id="tmpl_flash">
      <p class='flash'><%= message %>!</p>
    </script>

    <div id="flash"></div>


    // application.js
    var FlashView = Backbone.View.extend({
      el: '#flash',

      render: function(message) {
        var my_template = _.template($('#tmpl_flash').html());
        this.$el.html(my_template({message: message}));
        return this;
      }
    });

    var flashview = new FlashView();


Now we can register listeners for when the FlashView should do stuff:

    // `FlashView` definition
    initialize: function() {
      var that = this;
      EventBus.on('image:added', function() {that.render("image added successfully")});
      EventBus.on('image:removed', function() {that.render("image removed successfully")});
    }


Style the flash:

    #flash {
        max-width: 60%;
        margin:10px auto 30px auto;
        border-radius: 10px;
        padding: 7px;
        border: 1px solid yellow;
        background-color: #cca;
        text-align: center;
    }


    showMessageThenFade: function(message) {
      var that = this;
      this.render(message);
      setTimeout(function() { that.$el.slideup(); }, 1000);
    }


    // change the `initialize` function to call the fade
    EventBus.on('image:removed', function() {that.showMessageThenFade("image removed successfully"); });


    // in the `render` function, we now need to show the element
    this.$el.slideDown();


Showing a message when the gallery is empty:

    <ul id="demo_images">
      <p class='empty_gallery'>no images in this gallery</p>
    </ul>
 

    // GalleryView.initialize() 
    var that = this;
    this.collection = new Gallery();
    this.collection.bind('add', this.appendItem, this);
    EventBus.on('image:added', function() { $('.empty_gallery', that.$el).hide(); } );
    EventBus.on('image:removed', function() { 
      if (0 === that.$el.children('li').length) {
        $('.empty_gallery', that.$el).show(); 
      }
    });



tidy the invalid html:

    <script type="text/template" id="tmpl_gallery">
      <div>
        <h2>Photo Gallery</h2>
        <p class="empty_gallery">No images in this gallery.</p>
        <ul class="gallery_images"></ul>
      </div>
    </script>

    // remove the `demo_images` container, and replace it with a placeholder for the gallery template
    <div id="gallery_container"></div>


    // change the GalleryView to target the new element, and add a render function
    var GalleryView = Backbone.View.extend({
      el: '#gallery_container',

    render: function() {
      var my_template = _.template($('#tmpl_gallery').html());
      this.$el.html(my_template());
      return this;
    },


    // and alter the appendItem method...
    $('ul', this.$el).append(imageView.render().el);

    // and the initialize
    if (0 === that.$el.find('li').length) { // was `children`

    this.render();




Rename 'Gallery' to 'Album' everywhere in application.js and index.html
The purpose is to make this more re-useable

Remove the `initialize` method on the Album, and rename it `ImageContainer`

    var PictureContainer = Backbone.Collection.extend({
      model: Image
    });


Create a new Album, which is a Backbone model.

    var Album = Backbone.Model.extend({
      defaults: {
          title: '',
          pictures: null
      },
      initialize: function() {
        this.set({pictures: new PictureContainer()});
      }
    });


replace `this.collection` to `this.model` in `AlbumView.add()` `AlbumView.initialize()`


and add an `add` function:

    add: function(image) {
      var images = this.get('images');
      images.add(image);
      this.trigger('add', image);
    }


Remove form from main page and put it into the Gallery template.
Change form ID to form class. 
Move events hash from AppView to AlbumView. 

Move addImage from AppView to AlbumView, and rename to 'addImageFromForm'. Update in the events hash too. 
Update `this.gallery.add` to `this.add` in our `addImageFromForm` method.




delete functions from app_view - since they're not needed any more.
and the corresponding "setAlbum" call.


Let's add a collection of albums.


    var Gallery = Backbone.Collection.extend({ model: Album });

    var GalleryView = Backbone.View.extend({ 
      tagname: 'div', 

      render: function() { 
        var my_template = _.template($('#tmpl_gallery').html());
        this.$el.html(my_template({albums: this.collection}));
        return this;
      }
    });


and a matching template

    <script type="text/template" id="tmpl_gallery">
      <h2>Available Albums</h2>
      <p>We have <%= albums.length %> <% if (1 == albums.length) { print("album"); } else { print("albums"); } %> in our gallery.</p>
      <ul>
        <% albums.each(function(album) { %>
          <li class="album" data-id="<%= album.cid %>"><img src="http://placehold.it/200x200" /><p><%= album.get('title') %></p></li>
        <% }) %>
      </ul>
    </script>



Initialize the AppView

    initialize: function() {
      this.gallery = new Gallery();
      var album = new Album({title: 'Bill Murray'});
      var image1 = new Image({title: 'Steve Zizzou', url: 'http://www.fillmurray.com/200/310'});
      var image2 = new Image({title: 'Venkman', url: 'http://www.fillmurray.com/205/320'});
      album.add(image1);
      album.add(image2);
      this.gallery.add(album);
      this.render();
    },

    showGallery: function() {
      var galleryView = new GalleryView({collection: this.gallery});
      this.$el.html(galleryView.render().el);
      return this;
    },

    render: function() {
      this.showGallery();
      return this;
    }


Remove the new album view definition at the bottom of the JS, and the `add image` calls

    var album = new AlbumView(); // delete
 
    album.add('Steve Zizzou', 'http://www.fillmurray.com/200/310'); // delete
    album.add('Venkman', 'http://www.fillmurray.com/205/320'); // delete



To show an album, add a method (like the showGallery) to the AppView

    showAlbum: function(album) {
      var albumView = new AlbumView({model: album});
      this.$el.html(albumView.render().el);
      return this;
    }


Update GalleryView to have a `tagName: 'div'` in it
Remove the album_container div from index.html, and add a 'loading' message

    // `GalleryView`
    events: {'click li.album': "showAlbum" }

    showAlbum: function(ev) { 
      var $clickedItem = $(ev.currentTarget);
      var id = $clickedItem.data('id');
      EventBus.trigger('display:album', this.collection.get(id));
    }


in `AppView.initialze()`

    _.bindAll(this, 'showAlbum'); // so "this" refers to the AppView, not the album
    EventBus.on('display:album', this.showAlbum);


remove

        this.model = new Album();

from `AlbumView.initialize()`




















