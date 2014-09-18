define(function(require){


  // Imports:
  var Backbone = require('backbone');
  var countries = require('../models/countries');
  var CountryDetailView = require('../views/detail');

  var CountriesRouter = Backbone.Router.extend({
    routes: {
      ':id': 'country',
      '*default': 'country'
    },

    // Implementation:
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
