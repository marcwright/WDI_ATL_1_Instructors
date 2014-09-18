define(function(require){
  var Backbone = require('backbone');
  var DetailView = require('../views/detail');
  var MovieDetail = require('../models/detail');
  var HomeView = require('../views/home');

  var WatchioRouter = Backbone.Router.extend({

    routes: {
      'home': 'home',
      'movies/:id': 'detail',
      '*default': 'home'
    },

    setView: function(view){
      if (this.view){
        this.view.remove();
      }
      this.view = view;
      this.view.render().appendTo('#main');
    },

    home: function(){
      var view = new HomeView();
      this.setView(view);
    },

    detail: function(id){
      var model = new MovieDetail({imdbID: id});
      var view = new DetailView({model: model});
      this.setView(view);
      model.fetch();
    }
  });
  return new WatchioRouter();
});
