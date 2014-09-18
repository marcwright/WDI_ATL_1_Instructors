define(function(require){
  var Backbone = require('backbone');
  var HomeView = require('../views/home');
  var DetailView = require('../views/detail');
  var DetailModel = require('../models/detail');

  var WatchioRouter = Backbone.Router.extend({
    routes: {
      'home': 'home',
      'movies/:id': 'detail',
      '*default': 'home'      //all else goes home
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
      var model = new DetailModel({imdbID: id});
      var view = new DetailView({model: model});
      this.setView(view);
      model.fetch();
    }
  });
  return new WatchioRouter();
});
