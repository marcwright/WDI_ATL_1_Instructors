
// A model for each individual track:

var Track = Backbone.Model.extend({
  defaults: {
    name: '',
    artists: []
  },

  getArtist: function() {
    return this.get('artists')[0].name;
  }
});


// A collection of Track models:

var Tracks = Backbone.Collection.extend({
  url: 'http://ws.spotify.com/search/1/track.json?q=Crazy+Train',
  model: Track,

  parse: function(data) {
    return data.tracks;
  }
});


// A view for displaying the collection of tracks:

var TracksView = Backbone.View.extend({
  el: '#tracks',

  initialize: function() {
    this.listenTo(this.collection, 'sync remove', this.render);
    this.collection.fetch();
  },

  render: function() {
    var html = this.collection.reduce(function(memo, model) {
      return memo + '<li>'+ model.get('name') +' ('+ model.getArtist() +')</li>';
    }, '');

    this.$el.html(html);
  }
});


// Create list of tracks and tracks view:

var tracks = new Tracks();
var tracksView = new TracksView({collection: tracks});