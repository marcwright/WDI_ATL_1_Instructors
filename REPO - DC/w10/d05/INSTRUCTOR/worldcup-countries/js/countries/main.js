var countries = new CountryCollection();
var router = new CountriesRouter({collection: students});

countries.fetch().then(function() {
  Backbone.history.start();
});
