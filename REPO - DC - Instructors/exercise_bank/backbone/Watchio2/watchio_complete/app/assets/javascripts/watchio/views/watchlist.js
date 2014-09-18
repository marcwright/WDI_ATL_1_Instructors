define(function(require) {
  
  // Imports:

  var Backbone = require('backbone');
  var _ = require('underscore');
  var watchlist = require('../models/watchlist');

  // Implementation:

  var WatchlistView = Backbone.View.extend({
    el: '#watchlist',
    template: _.template( require('text!../templates/watchlist.html') ),

    initialize: function() {
      this.listenTo(this.collection, 'add remove sync', this.render);
      this.render();
    },

    render: function() {
      var rendered = this.template({collection: this.collection});
      return this.$el.html(rendered);
    }
  });

  return new WatchlistView({collection: watchlist});
});