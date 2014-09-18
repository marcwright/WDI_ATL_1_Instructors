$(function() {
  var $body = $( "body" );
  var offset = 0;          // keep track of last page of results
  var searchOptions = "";  // keep track of most recent search

  function search() {
    var apiPath = "http://api.giphy.com/v1/gifs/search?api_key=dc6zaTOxFJmzC&" + searchOptions;
        apiPath += "&offset=" + offset;

    $.get( apiPath )
      .then( function( response ) {
        var data = response.data;

        // build HTML for batch insertion
        var imgListHTML = "";
        for ( var i = 0; i < data.length; i++ ) {
          var imgURL = data[i].images.original.url;
          imgListHTML += '<img src="' + imgURL + '" data-index="' + i + '">';
        }

        // paginate results
        offset += data.length;

        // add images to DOM
        $body.append( imgListHTML );
      });
  }

  $( "#search" ).on( "submit", function( evt ) {
    evt.preventDefault();
    offset = 0;  // reset offset for new searches
    
    searchOptions = $( this ).serialize();
    search();
  });

  $( window ).on( "scroll", _.debounce(function() {
    var $window = $( this );
    if( $window.scrollTop() + $window.height() >= $( document ).height() ) {
      search();
    }
  }, 1000));

  $body.on( "click", "img", function() {
    $( this ).toggleClass( "big" );
  });
});