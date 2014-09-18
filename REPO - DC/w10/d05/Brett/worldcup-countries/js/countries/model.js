// http://restcountries.eu/rest/v1

var Country = Backbone.Model.extend({
  defaults: {
    alpha2Code: "",
    name: "",
    isPlaying: false,
    isEliminated: false
  }
});

var CountryCollection = Backbone.Collection.extend({
  model: Country,
  url: "http://restcountries.eu/rest/v1"
});
