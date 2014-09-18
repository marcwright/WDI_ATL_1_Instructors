function search(name) {
  var api = 'http://www.strudel.org.uk/lookUP/json/?name=' + escape( name );
  // requires "jsonp" datatype

  $.ajax({
    url: apiPath,
    dataType: 'jsonp',
    method: 'delete'
  })
  .then( function( data ) {
    console.log( data );
  });
}

$( '#search' ).on( 'submit', function( e ) ) {
  e.preventDefault();
  var $searchName = $( '#search-name' ).val();
  search( searchName );
}
