// API:
// http://ws.spotify.com/search/1/track.json?q=Crazy+Train

var TrackModel = Backbone.Model.extend({
  defaults: {
    'name': '',
    'popularity': 0,
    'artists': []
  },

  getArtist: function() {
    return this.get('artists')[0].name;
  }
});

var TracksCollection = Backbone.Collection.extend({
  model: TrackModel,
  url: 'http://ws.spotify.com/search/1/track.json?q=Crazy+Train',
  parse: function( data ) {
    return data.tracks;
  }
});

var TracksView = Backbone.View.extend({
  el: '#tracks',

  initialize: function() {
    this.listenTo( this.collection, 'sync remove', this.render );
  },

  render: function() {
    this.$el.html( 'i have new data' );

    var html = '';

    for ( var i = 0, n = this.collection.length; i < n; i++ ) {
      var m = this.collection.at( i );
      html += '<li>' + m.get( 'name' );
      html += ' (' + m.getArtist() + ')</li>';
    }

    this.$el.html( html );
  }

});

var tracks = new TracksCollection();
var tracksView = new TracksView( { collection: tracks } );

tracks.fetch().then(function() {
  console.log( tracks.length );
});
