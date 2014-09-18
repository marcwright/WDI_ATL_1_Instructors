
// - Create an instance of the Countries Collection.
// - Create an instance of the CountryListView, attached to the collection.
// - Create an instance of the Router.
// - Fetch the countries collection, and then start Backbone history.


$(function(){
  var countriesCollection = new CountriesCollection();
  var countryListView = new CountryListView({collection: countriesCollection});
  var countryrouter = new CountryRouter();
  countriesCollection.fetch();
  Backbone.history.start();

});
