
var countries = new Countries();
var routes = new CountriesRouter();
var list = new CountryListView({collection: countries});

countries.fetch(function() {
  Backbone.history.start();
});
