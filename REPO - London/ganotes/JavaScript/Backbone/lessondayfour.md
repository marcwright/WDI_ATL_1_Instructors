# Backbone: events and event bus

## Objectives
- Students understand more about the Backbone event model
- Students have encountered the idea of an event bus.
- STudents can use an event bus to co-ordinate their apps. 


## Framing and background
- So we're picking up where we left off with our Notes app. Where did we get to? 
  - We'd built a simple Rails app that acted as a JSON API for our app. 
  - We had two related columns; an index, and an article view. 
  - And when we updated the note in the article view, it would update in the index, too. 
- How did we co-ordinate that? 
  - We didn't have to!
  - We had two views onto the same model. 
  - And whenever that changed, then Backbone would update that for us automatically. 
    - Well, nearly automatically... we had to tell the view to redraw whenever the model changed. 
- Sometimes, that's all you need. 
  - But not always. 

## Events and event bubbling
- We've talked a little bit about event bubbling. What's event bubbling? 
  - Events bubble up through the DOM all the way.
  - If you click a button, then a click event fires. 
  - If you've bound an event listener on the button, then it'll fire.
  - But otherwise it 'bubbles up' to the parent element, and any event listeners there fire. 
  - And so on, up the tree to the top. 
- Does Backbone work that way?
  - Kind of. 
  - Model events will also get triggered on their collections, but that's about it. 
  - So what if you wanted to have a navigation component that kept itself updated?
  - And something to show status messages? 

- You *could* just make everything available in your module, and make your navigation element aware of everything that can possibly emit events. 
  - But now you're tightly coupling your navigation to the rest of your app. 
  - If you want to change either of them, you've got to make sure you don't break anything. 
- Or, we can use an event bus. 

- What's an event bus? 
  - It's just an object. 
  - It's a bit like an aircraft control tower. 
  - Rather than have your objects talk to each other directly, they can talk to the control tower, and the control tower will tell anyone who cares. 


## Let's see an example. 
- Open up your Notes app. Make sure it's git committed. 
- We're going to add something that allows us to navigate our app. Some auto-updating breadcrumbs. 
  - We can't just listen to change events on the collection, because the collection isn't changing. 
  - So let's make an event bus that we can use instead. 
- Add a `<nav>` element into your page for your app to manage. 
- And a template for the navigation: 
  ```
  <script type="text/template" id="tmpl_navigation">
    <%% if (active == "index") { %>
      All notes
    <%% } else { %>
      <a href="#">All Notes</a> &gt; Note x 
    <%% } %>
  </script>
  ```
- Create a new view that manages this element. 
  ```
  Notes.Views.NavigationView = Backbone.View.extend({
    el: 'nav',
    template: _.template($('#tmpl_navigation').html()),
    initialize: function() { 
      this.render(); 
    }, 
    render: function(extra) { 
      params = {active: "index"};
      this.$el.html(this.template(params));
    }
  });
  ```
  - And create it during the setup method. 

- Hit refresh, and we see some breadcrumb navigation.
  - Nothing special so far. We've defined a render method that can take some extra data, if we want it to. And we've defined a params hash, which is what we're going to pass into our template.

- Now, we need two things to happen. 
  - We need our application to broadcast when the user views a specific note. 
  - And we need our nav bar to listen to those events. 

- Broadcasting is easy: 
  - Create an event bus in your module. We often call this a dispatcher. 
    ```
    Notes.dispatcher = _.clone(Backbone.Events);
    ```
  - Update our router to dispatch a message on our message bus whenever its showNote method fires. Inside showNote: 
    ```
    Notes.dispatcher.trigger('display:note', shownNote);
    ```
    - The first argument is just a string. Nothing magic about it. 
    - You might use colons as a way of 'namespacing' your events. Which is a posh way of saying 'organising'.
    - The second argument is extra data that gets passed along with the event. 
  - Let's make our showIndex broadcast an event too: 
    ```
    Notes.dispatcher.trigger('display:index');
    ```
- Listening for the event is easy too, certainly for the index. In the NavigationView initialiser: 
    ```
    Notes.dispatcher.on('display:index', this.render, this);
    Notes.dispatcher.on('display:note', function(note) { this.render(note); }, this);
    ```
  And in the NavigationView render: 
    ```
    render: function(extra) {
      params = {active: "index"};
      if (extra) {
        params.active = "shownote";
        params.note = extra;
      }
      this.$el.html(this.template(params));
    }
    ```

  - Test it
  - Works fine! Or should.
  - Update Nav so it shows the note title: `<%%= note.get('title')`

# Lab opportunity: Write a status bar. 
- Here's a little code you can give to the students that generates an event randomly every 4-20 seconds. 
  ```
  Notes.randomEvent = function() {
    var delay = 4000 + (Math.random() * 16000);
    var onOrOff = _.sample(['user:loggedon', 'user:loggedoff']);
    var name = _.sample(['Noor', 'Hana', 'Ben', 'Scotty', 'Niraj', 'Mike', 'Alex', 'Michael', 'Jason', 'Dan', 'Louie', 'Imran', 'Paul']);
    setTimeout(function() {
      console.log("Triggering " + onOrOff + " event for " + name);
      Notes.dispatcher.trigger(onOrOff, name);
      Notes.randomEvent();
    }, delay);
  };
  ```
- Apps often give some feedback when something happens. In a yellow bar, or similar. Think about how Gmail does it. 
- What if we did that for our app? 
- Create status messages for: 
  - Adding a note
  - Deleting a note
  - Changing a note
  - User comes online
  - User goes offline
- And drop in the code in Hipchat into your app, along with a call to randomEvent in your setup function.

