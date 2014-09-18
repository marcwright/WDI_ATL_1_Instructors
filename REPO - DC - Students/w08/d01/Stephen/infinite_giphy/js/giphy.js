/*
* @Author: stephenstanwood
* @Date:   2014-06-09 13:46:33
* @Last Modified by:   stephenstanwood
* @Last Modified time: 2014-06-09 14:30:47
*/

var keyword = '';
var offset = 0;

function search() {
  var apiPath = 'http://api.giphy.com/v1/gifs/search?api_key=dc6zaTOxFJmzC&q=';
  apiPath += escape( keyword );
  apiPath += '&offset=' + offset;

  $.getJSON( apiPath ).then( function( gifs ) {
    var html = '';

    for ( var i = 0; i < gifs.data.length; i++ ) {
      offset++;
      var imgUrl = gifs.data[i].images.original.url;
      html += '<img src="' + imgUrl + '" alt="" data-index="' + offset + '" >';
    }

    // console.log( html );
    $( 'body' ).append( html );
  });
}

$( '#search' ).on( 'submit', function( e ) {
  e.preventDefault();

  keyword = $( '#keyword' ).val();
  offset = 0;
  search();
});

$( window ).on( 'scroll', _.debounce( function() {
  if ( $( window ).scrollTop() + $( window ).height() >= $( document ).height() ) {
    search();
  }
}, 100));

$( 'body' ).on( 'click', 'img', function() {
  $( this ).toggleClass( 'big' );
});
