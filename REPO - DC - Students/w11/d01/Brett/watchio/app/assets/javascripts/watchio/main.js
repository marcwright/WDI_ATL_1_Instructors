define(function(require) {

  // Imports:

  var jquery_ujs = require('jquery_ujs');
  var Backbone = require('backbone');
  // Require all application components...

  var router = require("./routers/routes");
  var searchView = require("./views/search");
  var watchlist = require("./models/watchlist");
  var watchlistView = require("./views/watchlist");

  // Implementation:

  console.log('Ready to go...');
  Backbone.history.start();
  watchlist.fetch();
});
