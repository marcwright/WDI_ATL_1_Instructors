function search(name) {
  var apiPath = 'http://www.strudel.org.uk/lookUP/json/?name='+escape(name);
  // requires "jsonp" datatype.

  $.ajax({
    url: apiPath,
    dataType: 'jsonp'
  })
  .then(function(data){
    if(data.image.src.indexOf('//') === 0){
      data.image.src = 'http:' + data.image.src;
    }
    $('#preview').html('<img src="'+ data.image.src + '">');
  });
}

$('#search').on('submit', function(evt){
  evt.preventDefault();
  var name = $('#search-name').val();
  search(name);
});
