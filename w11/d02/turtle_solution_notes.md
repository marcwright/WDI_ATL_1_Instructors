## TMNT Solution Notes

__To display a list of turtles, we'll need turtle data.__

```javascript
// assets/javascripts/models/turtle.js
var Turtle = Backbone.Model.extend({
  defaults: {
    id: '',
    name: '',
    eyeband_color: '',
    weapon: '',
    image_url: '',
  }
});

var TurtleCollection = Backbone.Collection.extend({
  model: Turtle,
  url: '/turtles'
});
```

__Let's make sure this data behaves the way we expect__

```javascript
// main.js
var turtleCollection = new TurtleCollection();
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
  // this is a list view, so our el will be an unordered list
  tagName: 'ul',

  // grab the template specified in the spec
  template: _.template( $("#turtle-list-item-template").html() ),

  initialize: function(){
    // we listen to the collection to rerender on fetches
    this.listenTo(this.collection, 'sync add remove', this.render);
    this.render();
  },

  render: function(){
    var html = this.template({ collection: this.collection });
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

__Let's append everything the list view to the `.content-wrapper` div to make sure it's looks the way you'd expect__

```javascript
// main.js
var turtleCollection = new TurtleCollection();
turtleCollection.fetch().then(function(){
  var turtleListView = new TurtleListView({ collection: turtleCollection });
  turtleListView.$el.appendTo(".content-wrapper");
});
```

__Awesome. Our list view works perfectly and seems to update the url fragment when we click on a given item__

__The spec sheet says it wants the url to show us a new view, but tackling that challenge whole gives us two tasks instead of one. 
Let's first make sure that we can see our view on the page__

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
    var html = this.template( this.model.toJSON() );
    return this.$el.html(html);
  },
});
```

__Wonderful, but we need to actually make the template dynamic, so what does  that look like?__

```html
<script type="text/template" id="turtle-profile-template">
  <h1 class="<%%= eyeband_color %>"><%%= name.toUpperCase() %></h1>
  <img src="<%%= image_url %>" alt="<%%= name %>">
  <p class="weapon <%%= eyeband_color %>"><%%= weapon.toUpperCase() %></p>
</script>
```

__Let's actually instantiate the profile view with a sample model within main.js, appending it to the `.content-wrapper`__
```javascript
  // main.js
  var turtleProfileView = new TurtleProfileView({ model: turtleCollection.at(2) });
  turtleProfileView.$el.appendTo(".content-wrapper");
```

__It works. Now it's finally time we hooked this puppy up to our router, starting with the list view, which is our default__

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

__Now let's instantiate our router and start the backbone history so we can make sure the router is actually tracking changes__
```javascript
// main.js
var turtleCollection = new TurtleCollection();
turtleCollection.fetch().then(function(){
  var router = new Router();
  Backbone.history.start();
});
```

__Let's check the console. Is the router tracking changes?__

__Great, now we move on to building the clearView method, which we'll use in our route handlers, and we'll also build out the listTurtles route handler__

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
    this.view = new TurtleListView({ collection: turtleCollection });
    this.view.$el.appendTo(".content-wrapper");
  },
});
```

__Let's check the page. Does it actually work?__

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
    var turtle = turtleCollection.find(function(turtle){
      return turtle.get("id") === parseInt(id);
    });
    this.view = new TurtleProfileView({ model: turtle });
    this.view.$el.appendTo(".content-wrapper");
  },

});
```

__Everything seems to work. Now it's up to you






