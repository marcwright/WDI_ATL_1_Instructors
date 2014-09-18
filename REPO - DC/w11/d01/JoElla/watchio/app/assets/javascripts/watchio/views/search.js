define(function(require){

  var Backbone = require('backbone');
  var searchResults = require('../models/search');

  var SearchView = Backbone.View.extend({
    el: '#search',

    initialize: function(){
      //what the view starts with
      //to display output, you must listen to collection
      this.listenTo(this.collection, 'sync', this.render);
      //render the thing by default
      this.render();
    },

    render: function() {
      //this generates a list of search results
      var html = '';
      this.collection.each(function(model){
        html += '<option value="#movies/' + model.get('imdbID') + '">' + model.get('Title') + '</option>';
      });
      this.$('[name="search-results"]').html(html);

    },

    events: {
      'submit': 'onSubmit',
      'change [name="search-results"]': 'onSelectResult'
    },

    onSubmit: function(evt){
      //gets input
      evt.preventDefault();
      var searchTerm = this.$('[name="search"]').val();
      this.collection.search(searchTerm);

      this.$('input').val('');
    },

    onSelectResult: function(evt){
      evt.preventDefault();
      var selection = this.$(evt.target).val();
      window.location.hash = selection;
    }


  });

  return new SearchView({collection: searchResults});
});
