var $preview = $( "#preview" );

function search( options ) {
  var apiPath = 'http://www.strudel.org.uk/lookUP/json/?' + options;
  // requires "jsonp" datatype.
  
  $.ajax({
    url: apiPath,
    dataType: "jsonp"
  })
  .then(function( data ) {
    var imgSource = ( data.image.src.indexOf("//" === 0 ) ? "http:" : "//" ) + data.image.src;
    $preview.html("<img src='" + imgSource + "'>");
  })
  .fail(function() {
    throw "The API request failed.";
  });
}

$( "#search" ).on( "submit", function( evt ) {
  evt.preventDefault();
  var formData = $( this ).serialize();
  search( formData );
});