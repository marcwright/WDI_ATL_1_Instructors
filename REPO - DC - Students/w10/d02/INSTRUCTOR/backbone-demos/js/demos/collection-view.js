// API:
// http://ws.spotify.com/search/1/track.json?q=Crazy+Train

<<<<<<< HEAD
//Defines a single Track model:
=======
// Defines a single Track model:
>>>>>>> ac24a3e832b6fc7540dd90620a5fc5ac3677128e

var TrackModel = Backbone.Model.extend({

  defaults: {
    'name': '',
<<<<<<< HEAD
    'popularity' : 0,
    'artists' : []
  },

  getArtist: function(){
=======
    'popularity': 0,
    'artists': []
  },

  getArtist: function() {
>>>>>>> ac24a3e832b6fc7540dd90620a5fc5ac3677128e
    return this.get('artists')[0].name;
  }
});

<<<<<<< HEAD
// Defines a collection of Tracks Models
=======

// Defines a collection of Tracks models:
>>>>>>> ac24a3e832b6fc7540dd90620a5fc5ac3677128e

var TracksCollection = Backbone.Collection.extend({
  model: TrackModel,
  url: 'http://ws.spotify.com/search/1/track.json?q=Crazy+Train',
<<<<<<< HEAD
  parse: function(data){
    return data.tracks
  }
});

//Defines a view to render all tracks:
=======

  parse: function(data) {
    return data.tracks;
  }
});


// Defines a view to render all tracks:
>>>>>>> ac24a3e832b6fc7540dd90620a5fc5ac3677128e

var TracksView = Backbone.View.extend({

  el: '#tracks',

<<<<<<< HEAD
  initialize: function(){
    this.listenTo(this.collection, 'sync remove change', this.render);
  },

  render: function(){
    var html = '';
    this.collection.each(function(model){
      html += '<li>' + model.get('name') + '(' + model.getArtist() + ')</li>';
    });
    this.$el.html(html);
  }
});

var tracks = new TracksCollection();
var tracksView = new TracksView({collection: tracks});


tracks.fetch().then(function(){
  console.log(tracks.length);
});
=======
  initialize: function() {
    this.listenTo(this.collection, 'sync remove change', this.render);
  },

  render: function() {

    var html = '';

    this.collection.each(function(model) {
      html += '<li>'+ model.get('name') + ' ('+ model.getArtist() +')</li>';
    });

    this.$el.html(html);
  }

});


var tracks = new TracksCollection();
var tracksView = new TracksView({collection: tracks});

tracks.fetch().then(function() {
  console.log(tracks.length);
});
>>>>>>> ac24a3e832b6fc7540dd90620a5fc5ac3677128e
