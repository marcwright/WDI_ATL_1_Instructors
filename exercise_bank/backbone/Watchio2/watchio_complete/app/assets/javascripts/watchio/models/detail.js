define(function(require) {

  // Imports:

  var Backbone = require('backbone');

  // Implementation:

  var MovieDetail = Backbone.Model.extend({
    defaults: {
      Title: '',
      Year: '',
      Plot: '',
      Poster: ''
    },

    url: function() {
      return 'http://www.omdbapi.com/?i='+ this.id;
    }
  });

  return MovieDetail;
});