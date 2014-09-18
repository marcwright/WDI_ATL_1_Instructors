// http://restcountries.eu/rest/v1

var Country = Backbone.Model.extend({
  defaults: {
    alpha2Code: '',
    name: '',
    isPlaying: '',
    isEliminated: ''
  }
});

var CountriesCollection = Backbone.Collection.extend({
  model: Country,
  url: 'http://restcountries.eu/rest/v1'
});

var countriesCollection = new CountriesCollection();
countriesCollection.fetch();
