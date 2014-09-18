console.log("main.js connected");

var turtleCollection = new TurtleCollection();
turtleCollection.fetch().then(function(){
  var router = new Router();
  Backbone.history.start();
});
