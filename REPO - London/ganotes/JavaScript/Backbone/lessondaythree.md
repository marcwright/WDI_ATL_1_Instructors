# Outline
- More practice at stuff we did yesterday
- Better instantiation of our seed data. 
- Using EventBus as a way of building apps that communicate between themselves
- Using different views for the same data. 

## Framing
- What did we do yesterday? 
  - Created a Rails app which exposed a JSON API. 
  - Wrote a Backbone app that pulled down data from the server and displayed it
  - Showed how we could create new models
  - Showed how we could update existing ones
  - And mentioned that deletion works the same way... though we're not deleting anything. Yet. 
  - Overall, showed how easy it was to make Backbone work with Rails/restful APIs. 
- Today, we're going to continue practicing our Backbone, as well as looking at some other more advanced Backbone patterns. 
  - And really see some of the power of Backbone at work. 


## More advanced routing 
- NB TO INSTRUCTOR: NOT TOTALLY TESTED
- Let's show a specific note, via routes. 
  - Create a view for it. 
  - Add to our routes: `"notes/:id": "showNotes"`
  - Add a new method to our router: 
    ```
    showNotes: function(id) { 
      // ...
    }
    ```

- Catch-all routes: wildcards. 
  - We could use this in our apps to make more general-purpose routes...
  - ... But we're going to use it to make a "404" page. 
    - Add to our routes: `"*stuff": "show404"`. 
    - Add a new method to our router: `show404: function(stuff) { /* Render tmpl_404 */ }`
    - Add a template: 
      ```
      <script type="text/template" id="tmpl_404">
        <h2>404 Not Found</h2>
        <p>You tried to access <%= stuff %>, but our app doesn't know how to display it. Sorry.</p>
      </script>
      ```
    - Even if we go to something with slashes in it, we get the whole path in.



### Bootstrapping our app with JSON data
- NB TO INSTRUCTOR: THE ENTIRETY OF THE BELOW IS TAKEN FROM THE PHOTO NOTES AND IS COMPLETELY UNTRANSLATED 
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

## More components 
- The real power of Backbone comes from being able to have multiple views that display the same data. 
- And having them all stay up to date. 
- Like in, say, an inbox. 
- We could have a list of notes down one side, and display each individual note in its own pane. 
- And when we updated the details, or created a new note, it would show up automatically. 
- Let's do that. 

### Refactoring
- Let's update our HTML so we've got two columns. An unordered list of all our notes, and a main pane. 
  ```
  <div id="container">
    <ul id="all_notes"></ul>
    <div id="main_pane"></div>
  </div>
  ```
- And update our Backbone app so each bit manages the relevant part. 
  - NotesCollectionView renders into #all_notes
  - NoteCreationView renders into #main_pane
- And some CSS to go with it. 
  ```
  * { 
    box-sizing: border-box;
  } 

  #container { 
    vertical-align: top;
  }
    
  #all_notes { 
    margin-top: 0;
    width: 30%;
    border: 1px solid black;
    background-color: #fee;
    display: inline-block;
  }

  #all_notes h2 { 
  font-size: 120%;
  }

  #main_pane { 
    width: 60%;
    border: 1px solid black;
    background-color: #eef;
    display: inline-block;
  }

  ```

- Now we have our two-column layout, but... our left-columns aren't very index-like. 
- When we click them, we edit things. 
- Let's update our NotesCollectionView so it's rendering the note titles into that pane. 
  - Create a new template: 
    ```
    <script type="text/template" id="tmpl_note_link">
      <a href="#notes/<%%= note.id %>"><%%= note.get('title') %></a>
    </script>
    ```
  - Create an index view to display it: 
    ```
    Notes.Views.NoteIndexView = Backbone.View.extend({
      tagName: 'li',
      template: _.template($('#tmpl_note_link').html()),

      render: function() {
        this.$el.html(this.template({note: this.model}));
        return this;
      }
    });
    ```
  - And update our NotesCollectionView to render our new template (NoteView to NoteIndexView in the each block). 
  
  - Now we need to show our Note when we visit that URL. 
  - Add a new route to our router: `"notes/:id": "showNote"`
  - Add a new function: 
    ```
    showNote: function(id) { 
      var note = Notes.allNotes.get(id);
      var view = new Notes.Views.NoteView({model: note});
      $('#main_pane').html(view.render().el);
    }
    ```
  - Now, whenever we click a link, it gets drawn into our main view. 
  - Let's do one more thing: Let's make our NotescollectionView redraw when its collection changes. 
    ```
    initialize: function() { 
      this.listenTo(this.collection, 'change', this.render); 
    }
    ```
  - Now, when we click a link, we have two bits of data on screen at once. 
  - And now, whenever we edit something in the main pane, then the view in our list of messages changes automatically. 
  - TA DA

### Lab opportunity (do this in your address book)

### 404 pane 
- Use the * route

### Flash message
- Broadcast on an Event Bus. 



