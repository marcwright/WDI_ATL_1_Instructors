define(['backbone'], function(Backbone){

// Requires:
// - Backbone

  var Country = Backbone.Model.extend({
    defaults: {
      alpha2Code: '',
      name: '',
      isPlaying: false,
      isEliminated: false
    }
  });

  var Countries = Backbone.Collection.extend({
    model: Country,
    url: 'http://restcountries.eu/rest/v1'
  });
  return new Countries();
});
