/*
* @Author: stephenstanwood
* @Date:   2014-06-09 16:51:16
* @Last Modified by:   stephenstanwood
* @Last Modified time: 2014-06-10 08:26:06
*/

// hide the select button until the user searches
$( '#movie-select' ).hide();

function search() {
  var keyword = $( '#movie-search' ).val();
  $.getJSON( getAPIPath( 's', keyword ) ).then( function( results ) {
    processResults( $( '#movie-search' ).val(), results );
  });
}

function processResults( keyword, results ) {
  $mSelect = $( '#movie-select' );
  $mSelect.empty();

  var resString = 'Movies matching *' + keyword + '*';
  $mSelect.append( '<option>' + resString + '</option>')

  // cycle through each response, adding them as options
  var numResults = results.Search.length;

  // display the information (title/picture) for the first result
  if ( numResults > 0 ) dispMovieInfo( results.Search[ 0 ].imdbID );

  for ( var i = 0; i < numResults; i++ ) {
    var n = results.Search[ i ].Title;
    var id = results.Search[ i ].imdbID;

    $mSelect.append( '<option value="' + id + '">' + n + '</option>' );
  }
}

function getAPIPath( searchType, searchOn ) {
  var apiPath = 'http://www.omdbapi.com/?' + searchType + '=';
  return apiPath += escape( searchOn );
}

function dispMovieInfo( id ) {
  $.getJSON( getAPIPath( 'i', id ) ).then( function( results ) {
    $( '#result-movie-title' ).text( results.Title );
    $( '#result-movie-picture' ).attr( 'src', results.Poster );
  });
}

$( '#search' ).on( 'submit', function( e ) {
  e.preventDefault();
  $( '#movie-select' ).show();
  search();
});

$( '#movie-select' ).change( function() {
  dispMovieInfo( $( this ).val() );
});
