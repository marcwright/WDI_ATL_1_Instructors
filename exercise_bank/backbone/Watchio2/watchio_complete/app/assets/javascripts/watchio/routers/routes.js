define(function(require) {

  // Imports:

  var Backbone = require('backbone');
  var MovieDetail = require('../models/detail');
  var MovieDetailView = require('../views/detail');
  var HomeView = require('../views/home');

  // Implementation:

  var MoviesRouter = Backbone.Router.extend({
    routes: {
      'movies/:id': 'movie',
      'home': 'home',
      '*default': 'home'
    },

    setView: function(view) {
      if (this.view) {
        this.view.remove();
      }

      this.view = view;
      this.view.render().appendTo('#main');
    },

    movie: function(id) {
      var model = new MovieDetail({id: id});
      var detailView = new MovieDetailView({model: model});
      this.setView(detailView);
      model.fetch();
    },

    home: function() {
      var home = new HomeView();
      this.setView(home);
    }
  });

  return new MoviesRouter();
});