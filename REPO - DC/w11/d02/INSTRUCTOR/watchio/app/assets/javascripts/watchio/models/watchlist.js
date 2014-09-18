define(function(require) {

  var Backbone = require('backbone');

  var WatchlistItem = Backbone.Model.extend({
    defaults: {
      title: '',
      imdb_id: ''
    }
  });

  var Watchlist = Backbone.Collection.extend({
    model: WatchlistItem,
    url: '/movies'
  });

  return new Watchlist();
});