define(function(require){

  var Backbone = require('backbone');

  var SearchResult = Backbone.Model.extend({
    defaults: {
      Title: '',
      imdbID: ''
    }
  });

  var SearchResults = Backbone.Collection.extend({
    model: SearchResult,
    searchTerm: '',
    url: function(){
      return 'http://www.omdbapi.com/?s=' + escape(this.searchTerm);
    },

    search: function(keyword){
      this.searchTerm = keyword;
      this.fetch();
    },
//parse is a method that Backbone gives us.
//Whenever new data is loaded, it is passed to the parse method to get us
//the data we want from the API in a good format.
    parse: function(data){
      return data.Search;
    }
  });
  return new SearchResults();
});
