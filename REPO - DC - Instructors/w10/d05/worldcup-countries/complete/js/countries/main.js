var countries = new Countries();
var countriesList = new CountryListView({collection: countries});
var router = new CountriesRouter();

countries.fetch().then(function() {
  Backbone.history.start();
});