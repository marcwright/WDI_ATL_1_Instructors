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
