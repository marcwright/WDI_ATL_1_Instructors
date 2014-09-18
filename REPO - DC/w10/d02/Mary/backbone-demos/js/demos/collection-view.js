// API:
// http://ws.spotify.com/search/1/track.json?q=Crazy+Train

// Defines a single track model
var TrackModel = Backbone.Model.extend({
  defaults: {
    'name': '',
    'popularity': 0,
    'artists': []
  },

  // fat model
  getArtist: function() {
    return this.get('artists')[0].name;
  }

})

// Defines a collection of track models
var TracksCollection = Backbone.Collection.extend({
  model: TrackModel,

  url: 'http://ws.spotify.com/search/1/track.json?q=Crazy+Train',

  parse: function(data) {
    return data.tracks;
  }
})

// Defines a view to render all tracks
var TracksView = Backbone.View.extend({
  el: '#tracks',

  initialize: function() {
    this.listenTo(this.collection, 'sync remove change', this.render);
  },

  render: function() {
    var html = '';
    this.collection.each(function(model) {
      html += '<li>' + model.get('name') + ' (' + model.getArtist() + ')</li>';
    });
    this.$el.html(html);
  }
})

var tracks = new TracksCollection();
var tracksView = new TracksView({collection: tracks});

tracks.fetch().then(function() {
  console.log(tracks.length);
})
