define(function(require) {

  var Backbone = require('backbone');
  var _ = require('underscore');
  var detailHTML = require('text!../templates/detail.html');
  var watchlist = require('../models/watchlist');

  var DetailView = Backbone.View.extend({
    tagName: 'div',
    template: _.template(detailHTML),

    initialize: function() {
      this.listenTo(this.model, 'sync', this.render);
      this.listenTo(watchlist, 'add remove', this.renderButtonText);
    },

    getSavedMovie: function() {
      var id = this.model.get('imdbID');
      return watchlist.findWhere({imdb_id: id});
    },

    render: function() {
      var rendered = this.template(this.model.toJSON());
      this.renderButtonText();
      return this.$el.html(rendered);
    },

    renderButtonText: function() {
      var saved = this.getSavedMovie();

      if (saved) {
        this.$('#watchlist-toggle').text('Remove from watchlist');
      } else {
        this.$('#watchlist-toggle').text('Add to watchlist');
      }
    },

    events: {
      'click #watchlist-toggle': 'onToggleMovie'
    },

    onToggleMovie: function(evt) {
      var saved = this.getSavedMovie();

      if (saved) {
        saved.destroy();
      } else {
        watchlist.create({
          title: this.model.get('Title'),
          imdb_id: this.model.get('imdbID')
        });
      }
    }
  });

  return DetailView;
});