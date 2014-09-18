define(function(require) {

  var Backbone = require('backbone');
  var _ = require('underscore');
  var detailHTML = require('text!../templates/detail.html');
  var watchlist = require('../models/watchlist');

  var DetailView = Backbone.View.extend({
    tagName: 'div',
    template: _.template(detailHTML),

    initialize: function() {
      this.listenTo(this.model, 'sync sync remove', this.render);
    },

    render: function() {
      var rendered = this.template(this.model.toJSON());
      return this.$el.html(rendered);
    },
    
    renderButtonText: function() {
      var id = this.model.get('imdbID');
      var saved = watchlist.findWhere({ imdb_id: id });
    },

    events: {
      'click #watchlist-toggle': 'onToggleMovie'
    },

    onToggleMovie: function(evt) {
      var id = this.model.get('imdbID');
      var saved = watchlist.findWhere({ imdb_id: id });

      if (saved) {
        saved.destroy();
        this.$(evt.target).text('Remove from watchlist');

      } else {
        watchlist.create({
          title: this.model.get('Title'),
          imdb_id: id
        });
        this.$(evt.target).text('Add to watchlsit');
      }
    }
  });

  return DetailView;
});
