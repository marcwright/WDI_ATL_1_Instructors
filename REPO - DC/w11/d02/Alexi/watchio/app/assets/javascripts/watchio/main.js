define(function(require) {

  // Imports:

  var jquery_ujs = require('jquery_ujs');
  var Backbone = require('backbone');
  // Require all application components...

  var watchlist = require('./models/wathclist');
  var router = require('./routers/routes');
  var searchView = require('./views/search');
  var watchlistView = require('./views/wathclist');

  // Implementation:

  wathclist.fetch();
  Backbone.history.start();
});
