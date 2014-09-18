// API Docs at:
// https://developer.spotify.com/technologies/web-api/search/

// Album:
// 'http://ws.spotify.com/search/1/album.json?q=';

// Artist:
// 'http://ws.spotify.com/search/1/artist.json?q=';

// Track:
// 'http://ws.spotify.com/search/1/track.json?q=';

var $search = $('#search-type').val()

function submit(keyword) {
  var apiAlbumPath = 'http://ws.spotify.com/search/1/album.json?q=';

  apiAlbumPath += escape(keyword);

  $.getJSON(apiAlbumPath).then(function(albumResults) {

    var html = '';

    for (var i = 0; i < albumResults.albums.length; i++) {
      html += '<p>' + albumResults.albums[i].name + '</p>'
    }

    $("body").append(html);

  });
}


function submit(keyword) {
  var apiArtistPath = 'http://ws.spotify.com/search/1/artist.json?q=';

  apiArtistPath += escape(keyword);

  $.getJSON(apiArtistPath).then(function(artistResults) {

    var html = '';

    for (var i = 0; i < artistResults.artists.length; i++) {
      html += '<p>' + artistResults.artists[i].name + '</p>'
    }

    $("body").append(html);

  });

}

function submit(keyword) {
  var apiTrackPath = 'http://ws.spotify.com/search/1/track.json?q=';

  apiTrackPath += escape(keyword);

  $.getJSON(apiTrackPath).then(function(trackResults) {

    var html = '';

    for (var i = 0; i < trackResults.tracks.length; i++) {
      html += '<p>' + trackResults.tracks[i].name + '</p>'
    }

    $("body").append(html);

  });
}



$('#search').on('submit', function(evt) {
  evt.preventDefault();



  //var keyword = $('#search-keyword').val();

  keyword = $('#search-keyword'),val();
  offset = 0;

  if ($search == 'album') {
      return searchAlbum();
    } else if ($search == 'artist') {
      return searchArtist();
    } else if ($search = 'track') {
      return searchTrack();
    }
  });

  submit(keyword);

});
