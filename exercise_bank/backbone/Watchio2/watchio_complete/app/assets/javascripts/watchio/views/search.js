define(function(require) {

  // Imports:

  var Backbone = require('backbone');
  var search = require('../models/search');

  // Implementation:
  
  var SearchView = Backbone.View.extend({
    el: '#search',

    initialize: function() {
      this.listenTo(this.collection, 'reset sync', this.render);
      this.$results = this.$('#search-results').hide();
    },

    render: function() {
      var options = '';

      this.collection.each(function(model) {
        options += '<option value="'+ model.get('imdbID') +'">' + model.get('Title') + '</option>';
      });

      this.$('[name="search-results"]').html(options).trigger('change');

      if (this.collection.length) {
        this.$results.slideDown();
      } else {
        this.$results.slideUp();
      }
    },

    events: {
      'submit': 'onSubmit',
      'change select': 'onSelect'
    },

    onSubmit: function(evt) {
      evt.preventDefault();
      var title = this.$('[name="search"]').val();
      this.collection.search(title);
      this.$('form')[0].reset();
    },

    onSelect: function(evt) {
      var id = this.$('select').val() || '';
      window.location.hash = '#movies/'+id;
    }
  });

  return new SearchView({collection: search});
});