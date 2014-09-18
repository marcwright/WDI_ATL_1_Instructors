define(function(require) {
  
  // Imports:

  var Backbone = require('backbone');

  // Implementation:

  var SearchResult = Backbone.Model.extend({
    defaults: {
      Title: '',
      imdbID: ''
    }
  });
  
  var SearchResults = Backbone.Collection.extend({
    model: SearchResult,
    title: '',

    url: function() {
      return 'http://www.omdbapi.com/?s='+ escape(this.title);
    },

    parse: function(data) {
      return data.Search;
    },
    
    search: function(title) {
      this.title = title;

      if (this.title) {
        this.fetch();
      } else {
        this.reset();
      }
    }
  });

  return new SearchResults();
});