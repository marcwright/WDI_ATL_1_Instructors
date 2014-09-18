define(function(require){

  var Backbone = require('backbone');

  var SearchResult = Backbone.model.extend({
    defaults: {
      Title: '',
      imdbID: ''
    }
  });

  var SearchResults = Backbone.Collection.extend({
    searchTerm: '',

    url: function() {
      return 'http://www.omdbapi.com/?s=' + escape(this.searchTerm);
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
