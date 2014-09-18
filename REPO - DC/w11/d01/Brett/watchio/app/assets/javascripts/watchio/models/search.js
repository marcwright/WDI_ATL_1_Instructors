define(function(require) {

  var Backbone = require("backbone");

  var SearchResult = Backbone.Model.extend({
    defaults: {
      Title: "",
      imdbID: ""
    }
  });

  var SearchResults = Backbone.Collection.extend({
    model: SearchResult,
    searchTerm: "",

    url: function() {
      return "http://www.omdbapi.com/?s=" + escape(this.searchTerm);
    },

    search: function(keyword) {
      this.searchTerm = keyword;
      this.fetch();
    },

    parse: function(data) {
      return data.Search;
    }
  });

  return new SearchResults();
});
