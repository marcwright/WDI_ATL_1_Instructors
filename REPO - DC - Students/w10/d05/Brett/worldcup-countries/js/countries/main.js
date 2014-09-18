var countries = new CountryCollection();
var countryListView = new CountryListView({collection: countries});
var router = new CountryRouter({collection: countries});

countries.fetch().then(function() {
  Backbone.history.start();
});
