/*
* @Author: stephenstanwood
* @Date:   2014-06-09 14:47:11
* @Last Modified by:   stephenstanwood
* @Last Modified time: 2014-06-09 17:04:50
*/

// spotify returns a max of 100 per query
var LIMIT = 100;
var page = 1;

var urls = {};
urls['album'] = 'http://ws.spotify.com/search/1/album.json?q=';
urls['artist'] = 'http://ws.spotify.com/search/1/artist.json?q=';
urls['track'] = 'http://ws.spotify.com/search/1/track.json?q=';

function search() {
  // clear previous search resultsx
  $('body li').remove();

  var searchType = $( '#search-type option:selected' ).val();
  var apiPath = urls[ searchType ];
  apiPath += escape( $( '#movie-search' ).val() );

  if ( page > 1 ) apiPath += '&page=' + page;
// console.log(apiPath);
  $.getJSON( apiPath ).then( function( results ) {
    var html = '<ul>';
    var num = numResults( results, searchType );
    for ( var i = 0; i < num; i++ ) {
      var name = results[searchType + 's'][ i ][ 'name' ];
      html += '<li>' + name + '</li>';
    }

    var total = results.info.num_results;
    var pages = Math.ceil( total / LIMIT );

    var res = 'displaying ' + ( num - 100 + 1) + '-' + num + ' of ' + total + ' results. pages: ';
    $( '#result-page' ).text( res );

    for ( var p = 1; p <= pages; p++ ) {
      var link = $( '#result-page').append( '<a href="">' + p + '</a>' );
      if ( p != page) link.addClass( 'next-page' );
    }
    setUpPaginationClicks();

    $( 'body' ).append( html + '</ul>' );
  });
}

$( '#search' ).on( 'submit', function( e ) {
  e.preventDefault();
  page = 1;
  search();
});

$( '#search-type' ).change( function() {
  page = 1;
  search();
});

function setUpPaginationClicks() {
  $( '.next-page' ).click( function( e ) {
    e.preventDefault();
    page = parseInt( $( this ).text() );
    search();
  });
}

function numResults( results, searchType ) {
  return results[ searchType + 's' ].length;
}
