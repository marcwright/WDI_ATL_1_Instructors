define(function(require) {

  // Required IMPORTS:
  // - Backbone
  var Backbone = require('backbone');
  // - Countries model
  var countries = require('../models/countries');
  // - CountryDetailView
  var CountryDetailView = require('../views/detail');

  // Required IMPLEMENTATION:

  var CountriesRouter = Backbone.Router.extend({
    routes: {
      ':id': 'country',
      '*default': 'country'
    },

    country: function(id) {
      if (this.view) {
        this.view.remove();
      }
      
      if (!id) {
        id = countries.at(0).get('alpha2Code');
        this.navigate(id);
      }

      var country = countries.findWhere({alpha2Code: id});
      this.view = new CountryDetailView({model: country});
      this.view.render().appendTo('#country-main');
    }
  });
  return new CountriesRouter();
});
