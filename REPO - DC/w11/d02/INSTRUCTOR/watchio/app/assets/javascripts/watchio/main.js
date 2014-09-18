define(function(require) {

  // Imports:

  var jquery_ujs = require('jquery_ujs');
  var Backbone = require('backbone');
  // Require all application components...

  var watchlist = require('./models/watchlist');
  var router = require('./routers/routes');
  var searchView = require('./views/search');
  var watchlistView = require('./views/watchlist');

  // Implementation:

  watchlist.fetch();
  Backbone.history.start();
});