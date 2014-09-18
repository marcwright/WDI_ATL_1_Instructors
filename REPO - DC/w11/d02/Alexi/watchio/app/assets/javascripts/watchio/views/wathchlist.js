define(function(require){
  var Backbone = require('backbone');
  var watchlist = require('..models/watchlist');
  var WatchlistView = Backbone.View.extend({
    el: '#watchlist',

    initialize: function() {
      this.listenTo(this.collection, 'sync', this.render);
    },
    render: function() {
      var html = '';

      this.collection.each(function(model) {
        html += '<li><a href="#movies/' + model.get('imdb_id') + '">' + model.get('title') +'</a></li>'
      });
    this.collection
    }
  });

  return new WatchlistView({ collection: watchlist });
});

