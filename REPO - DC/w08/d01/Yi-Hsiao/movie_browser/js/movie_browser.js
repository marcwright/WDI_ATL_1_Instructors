// API Docs at: 
// http://www.omdbapi.com

function MovieBrowser() {
  this.api = new OpenMovieDBAPI();
  this.initialize();
}

MovieBrowser.prototype = {
  initialize: function() {
    this.$form = $( "#search" );              // search form
    this.$searchField = $( "#movie-search" ); // search field
    this.$dropdown = $( "#movie-select" );    // dropdown
    this.$detail = $( "#movie-detail" );      // movie details
    
    var browser = this;

    this.$form.on( "submit", function( evt ) {
      evt.preventDefault(); // prevent form from refreshing page

      var title = browser.$searchField.val();
      browser.api.searchMovies( title, browser.populateDropdown, browser );
    });

    this.$dropdown.on( "change", function() {
      var id = $( this ).val();
      browser.api.findMovie( id, browser.showDetails, browser );
    });
  },
  populateDropdown: function( data ) {
    this.$dropdown.show();

    // populate dropdown
    var html = "";
    for ( var i = 0; i < data.length; i++ ) {
      var movieData = data[i];
      html += '<option value="' + movieData.imdbID + '">' + movieData.Title + "</option>";
    }
    this.$dropdown.html( html );
    
    // also pull first movie in dropdown
    var id = this.$dropdown.val();
    this.api.findMovie( id, this.showDetails, this );
  },
  showDetails: function( movie ) {
    var html = "";
    html += "<h2>" + movie.Title + "</h2>";

    var hasPoster = movie.Poster.indexOf("http") === 0;
    html += hasPoster ? '<img src="' + movie.Poster + '">' : "<p>No poster found.</p>";
    
    this.$detail.html( html );
  }
};