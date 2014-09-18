define(function(require) {

  var Backbone = require("backbone");

  var MovieDetail = Backbone.Model.extend({
    defaults: {
      Title: "",
      imdbID: "",
      Poster: "",
      Plot: ""
    },

    url: function() {
      return "http://www.omdbapi.com/?i=" + this.get("imdbID");
    }
  });

  return MovieDetail;
});
