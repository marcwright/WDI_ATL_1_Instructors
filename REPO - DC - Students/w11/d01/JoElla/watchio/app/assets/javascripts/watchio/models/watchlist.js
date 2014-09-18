define(function(require){
  var Backbone = require('backbone');

  var Watchlist = Backbone.Model.extend({
    defaults: {
      'title': 'title',
      'imdbID': 'imdbID'
    }

  url: '/movies'
  });

  return Watchlist;
});
