# Backbone review

## Objective
- Consolidate the previous learning of the previous Backbone lessons
- Review the concepts we've covered in Backbone in a small, unchallenging app


## Framing
- Over the past few days, we've seen a whole bunch of Backbone. 
- We've covered the basic stuff, and we built a complicated app. 
- And we moved bits around as we learned more, and we hooked it up to Rails. Which involved a whole bunch of extra moving stuff about. 
- Let's go over a simple Backbone app that's connected to Rails from the start. Let's build a notepad. 


## Jumping in.
- Let's start with a new Rails app. We'll do what we did yesterday: create a static controller to serve our markup, and a controller to serve JSON to our app. 
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
    - Make sure they're available on the console. (enter '_' and 'Backbone')
  - Let us add random stuff to our header from our template: add `<%= yield :head %>` in our app/views/layouts/application.html.erb in the head.

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
    - Fetches it from the server. 
    - When it's fetched, ask the view to render.


## Creating new notes 
- In our photo gallery, we used an EventBus to co-ordinate our app. 
  - We triggered events, and our AppView would listen for them, and update the view accordingly. 
  - We're going to skip the AppView step. We're going to get our Router to create Views, and render them directly. 
  - Which means we're going to create a new Backbone view. 
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
      - Construct a new router, and a new collection for our notes. Fetch them from our server. 
    - Our link should now work. 
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



