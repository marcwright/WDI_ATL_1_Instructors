define(function(require){

  var Backbone = require('backbone');

  var MovieDetail = Backbone.Model.extend({

    defaults: {
      imdbID: '',
      Title: '',
      Plot: '',
      Poster: ''
    },

    url: function(){
      return 'http://www.omdbapi.com/?i=' + this.get('imdbID');
    },

  });
  return MovieDetail;
});
