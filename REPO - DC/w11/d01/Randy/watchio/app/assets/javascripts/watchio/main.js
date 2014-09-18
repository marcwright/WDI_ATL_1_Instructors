define(function(require) {

  // Imports:
  var jquery_ujs = require('jquery_ujs');
  var Backbone = require('backbone');

  // Require all application components...
  var router = require('./routers/routes');
  var SearchView = require('./views/search');
  var watchList = require('./models/watchlist');
  var watchListView = require('./views/watchlist');

  // Implementation:
  console.log('Ready to go...');
  Backbone.history.start();
  watchList.fetch().done(function(){

  });

});
