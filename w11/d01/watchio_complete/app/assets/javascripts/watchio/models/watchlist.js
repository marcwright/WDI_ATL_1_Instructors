define(function(require) {
  
  // Imports:

  var Backbone = require('backbone');

  // Implementation:

  var WatchlistItem = Backbone.Model.extend({
    defaults: {
      imdb_id: '',
      name: ''
    }
  });

  var Watchlist = Backbone.Collection.extend({
    model: WatchlistItem,
    url: '/movies'
  });

  return new Watchlist();
});