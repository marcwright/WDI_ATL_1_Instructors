//Only two jobs for the view controller

define(function(require){

  var Backbone = require('backbone');
  var searchResults = require('../models/search');

  var SearchView = Backbone.View.extend({
    el: '#search',

    events: {
      'submit': 'onSubmit',
      'change [name="search-results"]': 'onSelectResult'
    },

    initialize: function() {
      this.listenTo(this.collection, "sync", this.render);
      this.render();
    },

    onSubmit: function(evt){
      evt.preventDefault();
      var searchTerm = this.$('[name="search"]').val();
      this.collection.search(searchTerm);
      this.$('input').val('');
    },

    onSelectResult: function(evt){
      evt.preventDefault();
      var selection = this.$(evt.target).val();
      window.location.hash = selection;
    },

    render: function() {
      //This will generate a list of search results based on the current model data.
      var html = '';
      this.collection.each(function(model){
        html += '<option value="#movies/' + model.get('imdbID') + '">' + model.get('Title') + '</option>';
      });
      this.$('[name="search-results"]').html(html);
    }

  });
  return new SearchView({collection: searchResults});
});
