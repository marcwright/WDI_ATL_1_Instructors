/*
* @Author: stephenstanwood
* @Date:   2014-06-27 12:42:39
* @Last Modified by:   stephenstanwood
* @Last Modified time: 2014-06-27 21:46:45
*/

var Country = Backbone.Model.extend({
  defaults: {
    alpha2Code: '',
    name: '',
    isPlaying: true,
    isEliminated: false
  },

  initialize: function ( obj ) {
    this.alpha2Code = obj.alpha2Code;
    this.name =  obj.name;
    this.isPlaying = true;
    this.isEliminated = false;
  },

  toggleElimination: function() {
    var newStatus = !this.get( 'isEliminated' );
    this.set({ 'isEliminated': newStatus });
  },

  togglePlaying: function() {
    var newStatus = !this.get( 'isPlaying' );
    this.set({ 'isPlaying': newStatus });
  }
});

var CountryCollection = Backbone.Collection.extend({
  model: Country,
  url: 'http://restcountries.eu/rest/v1'
});
