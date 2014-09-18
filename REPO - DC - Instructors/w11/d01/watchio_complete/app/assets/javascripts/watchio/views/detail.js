define(function(require) {
  
  // Imports:

  var Backbone = require('backbone');
  var _ = require('underscore');
  var watchlist = require('../models/watchlist');
  
  // Implementation:

  var MovieDetailView = Backbone.View.extend({
    tagName: 'div',
    className: 'main-detail',
    template: _.template( require('text!../templates/detail.html') ),

    initialize: function() {
      this.listenTo(this.model, 'sync', this.render);
      this.listenTo(watchlist, 'add remove sync', this.renderWatchlistStatus);
      this.render();
    },

    render: function() {
      var rendered = this.template(this.model.toJSON());
      this.$el.html(rendered);
      this.renderWatchlistStatus();
      return this.$el;
    },

    renderWatchlistStatus: function() {
      var saved = watchlist.findWhere({imdb_id: this.model.id});
      this.$('#watchlist-toggle').text(saved ? 'Remove from Watchlist' : 'Add to Watchlist');
    },

    events: {
      'click #watchlist-toggle': 'onToggleWatch'
    },

    onToggleWatch: function() {
      var id = this.model.id;
      var saved = watchlist.findWhere({imdb_id: id});

      if (saved) {
        saved.destroy();
      } else {
        watchlist.create({
          imdb_id: id,
          title: this.model.get('Title')
        });
      }
    }
  });

  return MovieDetailView;
});