// API Docs at:
// https://developer.spotify.com/technologies/web-api/search/

// Album:
// 'http://ws.spotify.com/search/1/album.json?q=';
function searchAlbum(result) {
  var album = "";

 for(var i = 0; i < result.albums.length; i++) {
      album += '<li>'+ result.albums[i].name +'</li>';
    }

    $("#results").html(album)
  }

// Artist:
// 'http://ws.spotify.com/search/1/artist.json?q=';
function searchArtist(result) {
  var artist = "";

 for(var i = 0; i < result.artists.length; i++) {
      artist += '<li>'+ result.artists[i].name +'</li>';
    }

    $("#results").html(artist)
  }

// Track:
// 'http://ws.spotify.com/search/1/track.json?q=';
function searchTrack(result) {
  var track = "";

 for(var i = 0; i < result.tracks.length; i++) {
      track += '<li>'+ result.tracks[i].name +'</li>';
    }

    $("#results").html(track)
  }

var keyword = "";

function search() {
  var searchType = document.getElementById("search-type");
  var categorySelect = searchType.options[searchType.selectedIndex].value;
  var apiPath = "http://ws.spotify.com/search/1/" + categorySelect + ".json?q=";
  apiPath += escape(keyword);


  $.getJSON(apiPath).then(function(result) {
    if (categorySelect === "artist") {
    searchArtist(result);
    } else if (categorySelect === "album") {
      searchAlbum(result);
    } else {
      searchTrack(result);
    }

  });
}

$("#search").on("submit", function(event) {
  event.preventDefault();

  keyword = $("#search-keyword").val();

  search();
});

$("#search-type").on("change", search);


