console.log('turtle.js connected');

define(function(require) {
  
  var Backbone = require('backbone');

  var Turtle = Backbone.Model.extend({
    defaults: {
      id: '',
      name: '',
      eyeband_color: '',
      weapon: '',
      image_url: ''
    }
  });

  var TurtlesList = Backbone.Collection.extend({
    model: Turtle,
    url: '/turtles'
  });

  return new TurtlesList();
});
