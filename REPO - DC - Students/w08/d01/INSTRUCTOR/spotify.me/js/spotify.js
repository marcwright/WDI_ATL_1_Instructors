var keyword = "";

function searchByArtist() {
  var url = 'http://ws.spotify.com/search/1/artist.json?q='+keyword;

  $.getJSON(url).then(function(data) {
    var html = '';

    for (var i=0; i < data.artists.length; i++) {
      var artist = data.artists[i];
      html += '<li>'+ artist.name +'</li>';
    }

    $('#results').html(html);
  });
}


function searchByTrack() {
  var url = 'http://ws.spotify.com/search/1/track.json?q='+keyword;

  $.getJSON(url).then(function(data) {
    var html = '';

    for (var i=0; i < data.tracks.length; i++) {
      var track = data.tracks[i];
      html += '<li>'+ track.name +'</li>';
    }

    $('#results').html(html);
  });
}

function newSearch() {
  var searchType = $('#search-type').val();

  if (searchType === 'artist') {
    searchByArtist();
  } else {
    searchByTrack();
  }
}

$('#search').on('submit', function(evt) {
  evt.preventDefault();
  keyword = escape($('#search-keyword').val());
  newSearch();
});

$('#search-type').on('change', newSearch);
