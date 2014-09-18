// Document is ready
$(function() {

  // Grab the playlist element
  var playlist = $('#playlist');

  // Tell jQuery not to cache results
  $.ajaxSetup({ cache: false });

  // Grab the BBC JSON and turn it into a JavaScript object inside 'data'
  $.getJSON('http://www.bbc.co.uk/radio1/nowplaying/latest.json', function(data) {

    // Clear the playlist element
    playlist.empty();

    // Get a pretty variable name for data
    var now_playing = data.nowplaying;

    // Loop through array and print each artist
    for(var i = 0; i < now_playing.length; i++) {

      // Pretty variable name for current artist
      var current_artist = now_playing[i];

      // Append a new item to the playlist
      playlist.append('<li><img src="' + current_artist.image + '" width="25" height="25">' + current_artist.artist + ': ' + current_artist.title + '</li>');

    }

  });

});
