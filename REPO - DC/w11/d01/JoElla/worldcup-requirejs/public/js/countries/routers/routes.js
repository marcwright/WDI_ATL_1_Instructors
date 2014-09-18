// Requires:
// - Backbone
// - Countries model
// - CountryDetailView

define(function(require){
  //Imports (what it needs)
  var Backbone = require('backbone');
  var countries = require('../models/countries');
  var CountryDetailView = require('../views/detail');

  //Implementation (how it builds itself)
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
  return new CountriesRouter;
});
