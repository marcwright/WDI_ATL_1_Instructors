function OpenMovieDBAPI() {}

OpenMovieDBAPI.prototype = {
  baseURL: "http://www.omdbapi.com/",
  searchMovies: function( title, callback, context ) {

    var requestURL = this.baseURL + "?s=" + escape( title );
    $.getJSON( requestURL )
      .success(function( response ) {
        var data = response.Search;
        callback.call( context, data );
      });
  },
  findMovie: function( id, callback, context ) {
    var requestURL = this.baseURL + "?i=" + escape( id );
    $.getJSON( requestURL )
      .success(function( response ) {
        callback.call( context, response );
      });
  }
};