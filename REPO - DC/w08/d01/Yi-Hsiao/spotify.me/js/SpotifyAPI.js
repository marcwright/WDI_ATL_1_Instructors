// API Docs at: 
// https://developer.spotify.com/technologies/web-api/search/

// Album:
// 'http://ws.spotify.com/search/1/album.json?q=';

// Artist:
// 'http://ws.spotify.com/search/1/artist.json?q=';

// Track:
// 'http://ws.spotify.com/search/1/track.json?q=';

function SpotifyAPI() {}

SpotifyAPI.prototype = {
  baseAPI: "http://ws.spotify.com/search/1/",

  // expect options to be a query string
  getData: function( type, options, callback, context ) {
    var requestURL = this.baseAPI + type + ".json?" + options;

    $.get( requestURL, function( response ) {
      callback.call( context, type, response );
    });
  }
};