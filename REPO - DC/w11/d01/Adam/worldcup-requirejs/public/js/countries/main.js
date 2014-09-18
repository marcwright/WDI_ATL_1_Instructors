var countries = new Countries();
var router = new CountriesRouter();
var listView = new CountryListView({collection: countries});

countries.fetch().then(function() {
  Backbone.history.start();
});