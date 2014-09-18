console.log('Main...ready to go...');

define(function(require) {
  console.log("main.js connected");
  
  //Imports
  var Backbone = require('backbone');
  var jQuery = require('jquery');
  var jquery_ujs = require('jquery_ujs');
  var turtles = require('./models/turtle');
  
  //Require app components
  var listView = require('./views/list_view');

  // This is a way to test data
  // turtlelist.fetch().then(function(){
    // console.log(turtlelist.at(1).get('name'));
  // });

  turtles.fetch().then(function() {
    Backbone.history.start();
  });
});
