var countries = new CountriesCollection();
var countryListView = new CountryListView({collection: countries});
var router = new CountriesRouter();

countries.fetch().then(function(){
  Backbone.history.start();
});
