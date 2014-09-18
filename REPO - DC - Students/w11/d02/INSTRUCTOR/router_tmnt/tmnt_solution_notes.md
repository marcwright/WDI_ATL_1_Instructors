## TMNT Solution Notes

__To display a list of turtles, we'll need turtle data.__

```javascript
// assets/javascripts/models/turtle.js
var Turtle = Backbone.Model.extend({
  defaults: {
    id: 0,
    name: '',
    eyeband_color: '',
    weapon: '',
    image_url: '',
  }
});

var TurtleCollection = Backbone.Collection.extend({
  // whenever we call .fetch() on an instance of this collection, the instance will make an AJAX call to '/turtles'
  url: '/turtles',
  // when an instance of TurtleCollection fetches data, it needs a way to instantiate Turtle objects FROM that data, so we provide it with the Turtle constructor
  model: Turtle,
});
```

__Let's make sure this data behaves the way we expect by console logging each turtles name. If nothing is logged, debug.__

```javascript
// main.js
var turtleCollection = new TurtleCollection();
// .fetch() makes an AJAX call to '/turtles', so we use .then() to make sure we don't console log anything before the data is actually returned. 
turtleCollection.fetch().then(function(){
  turtleCollection.each(function(turtle){
    console.log( turtle.get("name") );
  });
});
```

__Okay, so the first specification is to see a list of turtles on page load. Let's build out a list view.__

```javascript
// views/list_view.js
var TurtleListView = Backbone.View.extend({
  // this is a list view, and the provided template uses <li> elements, so let's set our el to be an unordered list to which we can attach <li>s
  tagName: 'ul',

  // grab the template specified in the spec sheet
  template: _.template( $("#turtle-list-item-template").html() ),

  initialize: function(){
    // we listen to the collection to rerender on fetches
    this.listenTo(this.collection, 'sync add remove', this.render);
    this.render();
  },

  render: function(){
    // I altered my template (see below) to look for a collection, so we pass the template a collection
    var html = this.template({ collection: this.collection });
    // we return something from render so that we can chain method calls off of it
    return this.$el.html(html);
  },
});
```

__Let's add iteration logic to the template__
```html
<script type="text/template" id="turtle-list-item-template">
  <%% collection.each(function(turtle){  %>
    <li class="turtle <%%= turtle.get("eyeband_color") %>">
        <a href="#turtles/<%%= turtle.get("id") %>"><%%= turtle.get("name").toUpperCase()  %></a>
    </li>
  <%% }) %>
</script>
```

__Following the spec sheet, let's append the list view to the DOM's `.content-wrapper` div to make sure it looks the way you'd expect__

```javascript
// main.js
var turtleCollection = new TurtleCollection();
turtleCollection.fetch().then(function(){
  var turtleListView = new TurtleListView({ collection: turtleCollection });
  turtleListView.$el.appendTo(".content-wrapper");
});
```

__Your code should display an attractive list of 4 turtles, each of which should link to a different url fragment (Example: /#turtles/4). If it doesn't, debug.__

__The spec sheet says it wants the new url to trigger the display of a new view, but tackling that challenge whole gives us two tasks at once (route tracking and developing the profile view). Let's first make sure that we can get our profile view working correctly on the page__

```javascript
// views/turtle_profile_view.js
var TurtleProfileView = Backbone.View.extend({
  tagName: 'div',
  className: 'profile',

  // grab the template specified in the spec sheet
  template: _.template( $("#turtle-profile-template").html() ),

  initialize: function(){
    this.listenTo(this.model, 'change', this.render);
    this.render();
  },

  render: function(){
    // here we pass the template function a JSON object (as opposed to a model or collection attribute), because I want to keep the language within the template as clean as possible. See template below.
    var html = this.template( this.model.toJSON() );
    return this.$el.html(html);
  },
});
```

__Wonderful, but we need to actually make the template dynamic, so what changes do we make?__

```html
<script type="text/template" id="turtle-profile-template">
  <h1 class="<%%= eyeband_color %>"><%%= name.toUpperCase() %></h1>
  <img src="<%%= image_url %>" alt="<%%= name %>">
  <p class="weapon <%%= eyeband_color %>"><%%= weapon.toUpperCase() %></p>
</script>
```

__To make sure our view works as it should, let's instantiate the profile view with a sample model within main.js, appending it to the `.content-wrapper`__
```javascript
  // main.js
turtleCollection.fetch().then(function(){
  var turtleProfileView = new TurtleProfileView({ model: turtleCollection.at(2) }); // NOTE: turtleCollection.at(2) is a temporary model choice for proof of working profile view.
  turtleProfileView.$el.appendTo(".content-wrapper");
});
```

__Does our profile view appear on the page in the proper formatting/styling? If not, debug. When it renders appropriately, it's time to hook this puppy up to a router, starting with the list view, which is our default__

```javascript
// routers/router.js
var Router = Backbone.Router.extend({
  routes: {
    'turtles'    : 'listTurtles',
    '*default'    : 'listTurtles',
  },

  listTurtles: function(){
    console.log("listTurtles route handler firing");
  },
});
```

__Now let's instantiate our router and start the backbone history so we can make sure the router is actually tracking changes in the address bar__
```javascript
// main.js
var turtleCollection = new TurtleCollection();
turtleCollection.fetch().then(function(){
  var router = new Router();
  Backbone.history.start();
});
```

__Let's check the console as we visit the '/#turtles' route. Does it log the message specified above? If not, debug.__

__Great, now we move on to building the clearView method (which we'll use in our route handlers), and we'll also build out the listTurtles route handler__

```javascript
// routers/router.js
var Router = Backbone.Router.extend({
  routes: {
    'turtles'    : 'listTurtles',
    '*default'    : 'listTurtles',
  },

  clearView: function(){
    if (this.view){
      this.view.remove();
      this.view = null;
    }
  },

  listTurtles: function(){
    console.log("listTurtles route handler firing");
    this.clearView();
    // remember, turtles list view uses a collection in it's render function, so we'll pass the instance a collection
    this.view = new TurtleListView({ collection: turtleCollection });
    this.view.$el.appendTo(".content-wrapper");
  },
});
```

__Let's check the page. Does it actually work? If not, debug.__

__Beautiful, now let's add the `displayDetail` route handler__
```javascript
// routers/router.js
var Router = Backbone.Router.extend({
  routes: {
    'turtles'    : 'listTurtles',
    'turtles/:id' : 'displayDetail',
    '*default'    : 'listTurtles',
  },

  displayDetail: function(id){
    this.clearView();
    // gotta find the right turtle within the collection.
    var turtle = turtleCollection.find(function(turtle){
      return turtle.get("id") === parseInt(id);
    });
    // instances of TurtleProfileView reference a model in their render method, so we pass the instance a 'model' attribute
    this.view = new TurtleProfileView({ model: turtle });
    this.view.$el.appendTo(".content-wrapper");
  },

});
```






