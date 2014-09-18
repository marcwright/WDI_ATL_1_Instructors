// API Docs at:
// https://developer.spotify.com/technologies/web-api/search/

// Album:
// 'http://ws.spotify.com/search/1/album.json?q=';

// Artist:
// 'http://ws.spotify.com/search/1/artist.json?q=';

// Track:
// 'http://ws.spotify.com/search/1/track.json?q=';



function searchByAlbum(keyword) {
  var apiPath = 'http://ws.spotify.com/search/1/album.json?q='
  apiPath += escape(keyword);

  $.getJSON(apiPath).then(function(list){
    var html = '';
    for(var i = 0; i < list.albums.length; i++){
      html += '<p id="entries">' + list.albums[i].name; + '</p>'
    }
    $("#results").html(html);
  });
}

function searchByArtist(keyword){
  var apiPath = 'http://ws.spotify.com/search/1/artist.json?q='
  apiPath += escape(keyword);

  reset();

  $.getJSON(apiPath).then(function(list){
    var html = '';
    for(var i = 0; i < list.artists.length; i++){
      html += '<p id="entries">' + list.artists[i].name; + '</p>'
    }
    $("#results").html(html);
  });
}

function searchByTrack(keyword){
  var apiPath = 'http://ws.spotify.com/search/1/track.json?q='
  apiPath += escape(keyword);

  reset();

  $.getJSON(apiPath).then(function(list){
    var html = '';
    for(var i = 0; i < list.tracks.length; i++){
      html += '<p id="entries">' + list.tracks[i].name; + '</p>'
    }
    $("#results").html(html);
  });
}

$('#search').on('submit', function(evt){
  evt.preventDefault();

  var keyword = $('#search-keyword').val();
  var searchType = $('#search-type').val();
  if(searchType === "album"){
    searchByAlbum(keyword);
  } else if(searchType === "artist"){
    searchByArtist(keyword);
  } else if(searchType === "track"){
    searchByTrack(keyword);
  }
});
