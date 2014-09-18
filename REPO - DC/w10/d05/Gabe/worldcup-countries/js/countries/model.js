// http://restcountries.eu/rest/v1





//Make a Country model with the following fields:
var Country = Backbone.Model.extend({
  // urlRoot: '/characters',
  defaults: {
    alpha2Code: '',
    name: '',
    isPlaying: false,
    isEliminated: false
  }


});

//- Make a Countries collection that fetches data from "http://restcountries.eu/rest/v1".
var CountriesCollection = Backbone.Collection.extend({
  model: Country,
  //- Is this the url where the collection 'gets' it's data? a JSON api of countries.
  url: 'http://restcountries.eu/rest/v1'
});
