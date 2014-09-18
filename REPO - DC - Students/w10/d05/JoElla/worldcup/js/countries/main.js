$(function(){
  var countriesCollection = new CountriesCollection();
  var countryView = new CountryView({ collection: countriesCollection});
  var countryListItemView = new CountryListItemView({ collection: countriesCollection});
  countriesCollection.fetch();
})


