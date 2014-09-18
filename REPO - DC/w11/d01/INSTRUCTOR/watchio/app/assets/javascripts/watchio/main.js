define(function(require) {

  // Imports:

  var jquery_ujs = require('jquery_ujs');
  var Backbone = require('backbone');
  // Require all application components...

  var router = require('./routers/routes');
  var searchView = require('./views/search');

  // Implementation:

  console.log('Ready to go...');
  Backbone.history.start();
});