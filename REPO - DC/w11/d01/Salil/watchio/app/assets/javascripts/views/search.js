define(function(require){

  var Backbone = require('backbone');
  var searchResults = require('../models/search');

  var SearchView = Backbone.View.extend({
    el: '#search',

    initialize: function(){

    }
  });

  return new SearchView({collection: searchResults});
});

