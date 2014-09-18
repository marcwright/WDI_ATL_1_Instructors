// API Docs at:
// https://developer.spotify.com/technologies/web-api/search/

// Album:
// 'http://ws.spotify.com/search/1/album.json?q=';

// Artist:
// 'http://ws.spotify.com/search/1/artist.json?q=';

// Track:
// 'http://ws.spotify.com/search/1/track.json?q=';

var keyword = '';

function searchAlbum() {
  var apiPath = 'http://ws.spotify.com/search/1/album.json?q=';
  apiPath += escape(keyword);

  $.getJSON(apiPath).then(function(results) {

    var html = '';

    for (var i=0; i < results.albums.length; i++) {
      html += '<li>'+ results.albums[i].name + '</li>';
    }

    $("#results").append(html);
  });
}

function searchArtist() {
  var apiPath = 'http://ws.spotify.com/search/1/artist.json?q=';
  apiPath += escape(keyword);

  $.getJSON(apiPath).then(function(results) {

    var html = '';

    for (var i=0; i < results.artists.length; i++) {
      html += '<li>'+ results.artists[i].name + '</li>';
    }

    $("#results").append(html);
  });
}

function searchTrack() {
  var apiPath = 'http://ws.spotify.com/search/1/track.json?q=';
  apiPath += escape(keyword);

  $.getJSON(apiPath).then(function(results) {

    var html = '';

    for (var i=0; i < results.tracks.length; i++) {
      html += '<li>'+ results.tracks[i].name + '</li>';
    }

    $("#results").append(html);
  });
}

$('#search').on('submit', function(evt) {
    evt.preventDefault();

  var search = $('#search-type').val();
  keyword = $('#search-keyword').val();

  if (search === 'album') {
    searchAlbum();
  } else if (search === 'artist') {
    searchArtist();
  } else if (search === 'track') {
    searchTrack();
  }
});

$('#search-type').change( function() {
  $('#results').empty();
  $('#search').trigger('submit');
});

