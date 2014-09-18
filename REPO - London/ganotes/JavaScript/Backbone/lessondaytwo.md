
- Is Backbone more like Sinatra or Rails? 
  - I'd say Sinatra, because it's giving you some tools that take shortcuts rather than a whole bunch of infrastructure, generators, and strong conventions. 

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
- So, let's build ourselves a simple Rails app. 
  - An app that acts as a notepad. 


## Jumping in 
- Let's start with a new Rails app. We'll need a static controller to serve our markup, and a controller to serve JSON to our app. 
  ```
  rails new notepad
  git add notepad && git commit -am "New, empty Rails app." 
  cd notepad
  rails g controller static index --no-test-framework --no-helper
  rails g controller notes index --no-test-framework --no-template-engine --no-helper --no-assets
  rails g model note title:string body:string
  ```
  - We've created a new Rails app, along with a static controller. It's got one action, index. It's going to be our root. 
  - We've got another controller for our notes. We've got an index action, that's going to give us all our notes.
  - And we created a model to store our notes. 
- Test data. In db/seeds.rb:
  ```
  Note.create title: "Failure to plan is planning to fail."
  Note.create title: "Never pass up an opportunity to take water or pass water." 
  Note.create title: "When you hear hoofbeats, think horses, not zebras." 
  Note.create title: "Proper planning prevents piss-poor performance."
  ```
  - rake db:migrate
  - rake db:seed
- Let's configure our routes (config/routes.rb):
  ```
  root to: "static#index"
  resources :notes, defaults: {format: :json}
  ```
- Let's write our controller action (app/controllers/notes_controller.rb):
  ```
  class NotesController < ApplicationController
    respond_to :json

    def index
      @notes = Note.all
      respond_with @notes
    end
  end
  ```
  - respond_to :json says "Everything in this controller is going to return JSON". 
  - respond_with sends back the @notes as JSON. 
- Test it: 
  - curl http://localhost:3000/notes

- So we've got our data out as JSON. Let's build our frontend. 
  - Initial setup and sanity checking
    - rm public/index.html
    - Visit / in our browser, check we've got $ available on our JS console. 
    - Add underscore and backbone to our app/assets/javascripts directory.
    - List them in order in our app/assets/javascripts/application.js. 
    - Make sure they're available on the console. (enter `_` and `Backbone`)
  - Let us add random stuff to our header from our template: add `<%= yield :head %>` in our `app/views/layouts/application.html.erb` in the head.

- Cool. What do we want our frontend to do? 
  - Serious question.
  - Let's start with getting notes onto the page, and then worry about creating them. 

- Create a basic view in our views/static/index.html.erb:
  ```
  <% content_for :head do %>
    <script type="text/template" id="tmpl_note">
        <h2><%%= note.get('title') %></h2>
    </script>
  <% end %>

  <h1>My notes</h1>

  <div id="container">
    <p>Please wait, application loading...</p>
  </div>
  ```
  - content_for block renders into our named yield block
  - We've got an Underscore template there. We can presume it's going to get a note. 
  - And then we've created some basic content in the page itself. 

- Let's do our Backbone app now. 
  - In app/assets/javascripts/notes.js:
    ```
    // Empty module for our app.
    var notesApp = notesApp || {
      Models: {},
      Collections: {},
      Views: {},
      init: function() {}
    };
    ```
    - Creates an empty module, with namespaces
    - And an empty init function that doesn't do anything. 

  - Create a Model and a Collection for our notes: 
    ```
    // Model for our note.
    notesApp.Models.Note = Backbone.Model.extend({});

    // Collection of Notes.
    notesApp.Collections.NoteCollection = Backbone.Collection.extend({
      model: notesApp.Models.Note,
      url: '/notes'
    });
    ```
    - Our Notes are coming from the server; we don't need to set any attributes at all. 
    - Backbone understands REST. 
    - Our collection is a collection of notes. We give it a URL endpoint. 

  - Let's render our notes. We'll use two views: one to render each individual note, and one that renders the entire collection. 
    ```
    // View for a single Note.
    notesApp.Views.NoteView = Backbone.View.extend({
      tagName: 'div',

      render: function() {
        var template =  _.template($('#tmpl_note').html());
        this.$el.html(template({note: this.model}));
        return this;
      }
    });
    ```
    - tagName tells this view to create a new div
    - Get content of template from document, give it the model.
    - returns this, because that's what Backbone expects. 

    ```
    // View for all notes.
    notesApp.Views.NoteCollectionView = Backbone.View.extend({
      el: '#container',

      render: function() {
        var that = this;
        this.$el.empty();
        this.collection.each(function(noteModel) {
          var noteView = new notesApp.Views.NoteView({model: noteModel});
          that.$el.append(noteView.render().el);
        });
        return this; 
      }
    });
    ```
    - Empties the container it's managing (from el property)
    - Then, for each item in the collection, render a NoteView and add it to our $el.

  - And finally, we need to pull our app altogether, and start it. 
    ```
    // Initialiser for our notes.
    notesApp.init = function() {
      var allNotes = new notesApp.Collections.NoteCollection();
        allNotes.fetch({success: function() {
        var collectionView = new notesApp.Views.NoteCollectionView({collection: allNotes});
        collectionView.render();
      }});
    };
    notesApp.init();
    ```
    - Creates a new container.
    - Fetches JSON from the server. 
    - When it's fetched, ask the view to render.


## Creating new notes: backbone routers. 
- Let's set up a new view that contains our form for creating notes. 
    ```
    // View for new note form.
    notesApp.Views.NoteCreationView = Backbone.View.extend({
      el: '#container',
      render: function() {
        var template = _.template($('#tmpl_newnote').html());
        this.$el.html(template());
        return this;
      },
    });
    ```
    - Just renders a tmpl_newnote element. Let's create that, in our views/static/index.html.erb:
      ```
     <script type="text/template" id="tmpl_newnote">
       <form>
         <input name="title" placeholder="Note title" />
         <input type="submit" value="Save note" />
       </form>
     </script>
     ```
     - And add a link in our page (NOT in our container): `<a href="#new">Create new note</a>`

### Introduction to routers.
- So far, we've managed our app's state ourself. 
- We've added click handlers to things, and made our app state update accordingly. 
  - But this is kind of the boilerplate that we'd like our library to handle for us. 
  - And if we wanted to send someone a link to a specific page, we couldn't do it with click handlers.
- We can use Backbone's routers to handle this for us.
  - Let's create our router now. 
  - Add a `Routers: {}` onto our empty module. 
    ```
    notesApp.Routers.AppRouter = Backbone.Router.extend({
      routes: {
        "": "showIndex",
        "new": "createNewNote"
      },
    
      showIndex: function() {
        var collectionView = new notesApp.Views.NoteCollectionView({collection: notesApp.allNotes});
        collectionView.render();
      },
    
      createNewNote: function() {
        new notesApp.Views.NoteCreationView().render();
      }
    });
    ```
    - When the router sees a URL slug matching a key in the `routes` object literal, it calls the method given as a value. 
    - Hook it up in our app init: 
      ```
      notesApp.init = function() { 
         notesApp.router = new notesApp.Routers.AppRouter();
         notesApp.allNotes = new notesApp.Collections.NoteCollection();
         notesApp.allNotes.fetch({success: notesApp.router.showIndex});
         Backbone.history.start();
      };
      $(notesApp.init); // Call this function when our page has loaded.
      ```
      - Defining a new router, that knows about two actions. One that shows all notes, and one that shows the note creation view.
      - Starting the AppRouter, and telling Backbone to start routing things. 
      - Why history.start()? Because the docs say so. 
      - Construct a new router, and a new collection for our notes. Fetch them from our server. 
    - Our link should now work. 
    - No page reload: it's a hash slug, so we're not reloading the page. But we could send someone a direct link to it...

## Making the NoteCreationView work.
  - Hook up an event listener on it. On our NoteCreationView: 
    ```
    events: {'submit form': 'createNewNote'},
    createNewNote: function(ev) {
      ev.preventDefault();
      var $target = $(ev.currentTarget);
      var title = $('input[name="title"]').val();
      var note = new notesApp.Models.Note({title: title});
      notesApp.allNotes.add(note);
      note.save();
      notesApp.router.navigate("", {trigger: true});
    }
    ```
    - Adding it to a collection before we save it means it'll infer its URL from the collection's URL. 
    - router.navigate lets us go back to our root after we've created our image. 
  - Finally we need to teach Rails to save our new notes. In our app/controllers/notes_controller.rb:
    ```
    def create
      @note = Note.create params[:note]
      if @note.save
        respond_with @note, status: :created
      else
        respond_with @note, status: :unprocessable_entity
      end
    end
    ```
    - Check out the save! 
    - We didn't have to tell Backbone about this at all! 
    - Calling .save() automatically saved it to the server!

## Lab time

- We've come quite far. 
  - Built a new Rails app
  - Shown the data with Backbone
  - And created new elements. 
  - Could you do this for your addressbook? 
- You probably want to start over with a fresh Rails project, and copy the bits in you need.




## Updating notes 


  - What about updates? 
  - Gotta teach Rails about it first. In notes_controller:
    ```
    def update
      @note = Note.find params[:id]
      if @note.update_attributes params[:note]
        respond_with @note, status: :accepted
      else
        respond_with @note, status: :unprocessable_entity
      end
    end
    ```
    - Just like we get from a scaffold...
    - Where do we get the :accepted values from? 
      - Rails Guides http://guides.rubyonrails.org/layouts_and_rendering.html#the-status-option
      - The RFC http://www.w3.org/Protocols/rfc2616/rfc2616-sec6.html#sec6.1.1
  - Let's build an inline edit in our view. 
    - add an `events: {'click h2': 'changeToEditView'}` property on our NoteView.
    - add a `changeToEditView` property on our NoteView:
      ```
      changeToEditView: function(ev) {
        var $target = $(ev.currentTarget);
        var headline = $target.text();
        var newInput = $('<input>');
        newInput.val(headline);
        $target.replaceWith(newInput);
      },
      ```
      - Gets the element that the event was triggered on, gets its text, and creates a new input with that text in it. 
      - And replaces the h2 with that input element. 
    - Prove it works: click our headlines, turn them into inputs. 
    - Save the changes: add a `'blur input': 'saveChanges'` to our events hash.
    - Add a saveChanges method: 
      ```
      saveChanges: function(ev) {
        var $target = $(ev.currentTarget);
        var newHeadline = $target.val();
        this.model.set('title', newHeadline);
        this.model.save();
      },
      ```
    - Tell our view to re-render itself whenever its model changes, by adding an initialiser function: 
      ```
      initialize: function() {
        this.listenTo(this.model, "change", this.render);
      },
      ```
      - Listen for a 'change' event on `this.model`; when you see one, call `this.render`

  - BONUS CONTENT YOU SHOULD PROBABLY SKIP TO AVOID OVERHEATING THEIR MORNING BRAINS
    - You can make this save on enter, too.
    - Add `'keyup input': 'keyboardSaveChanges'` to our events hash
    - Add this function to our view:
      ```
      keyboardSaveChanges: function(ev) {
        if (13 == ev.keyCode) { // Enter key
          this.saveChanges(ev);
        }
      },
      ```


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


