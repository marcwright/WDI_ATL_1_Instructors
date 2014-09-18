// 1)* Create a Search model/collection that fetches from `http://www.omdbapi.com/?s={{ title }}`.
//Export an instance of the Search collection for use by other modules.


define(function(require) {

  var Backbone = require('backbone');

  var SearchResult = Backbone.Model.extend({
    defaults: {
      Title: '',
      imdbID: '',
    }
  });


  var SearchResults = Backbone.Collection.extend({
    searchTerm: '',

    url: function(){
      return 'http://www.omdbapi.com/?s=' + escape(this.searchTerm);
    },

    search: function(keyword) {
      this.searchTerm = keyword;
      this.fetch();
    },

    parse: function(data){
      return data.Search;
    }

  });

  return new SearchResults();

});
