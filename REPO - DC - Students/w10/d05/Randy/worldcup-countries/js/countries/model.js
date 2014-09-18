// http://restcountries.eu/rest/v1
var CountryModel = Backbone.Model.extend({

  defaults: {
    alpha2Code: '',
    name: '',
    isPlaying: false,
    isEliminated: false
  }

});

var CountriesCollection = Backbone.Collection.extend({
  model: CountryModel,
  url: 'http://restcountries.eu/rest/v1'
});
