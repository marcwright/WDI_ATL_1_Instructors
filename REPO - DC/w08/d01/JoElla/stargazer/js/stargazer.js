function search(name) {
  var apiPath = 'http://www.strudel.org.uk/lookUP/json/?name='+escape(name);
  // requires "jsonp" datatype.
  $.ajax({
    url: apiPath,
    dataType: 'jsonp',
    method: 'delete'
    })
  .then(function(data) {
    console.log(data);
  })

  });
}

$('#search').on('submit', function(evt){
  evt.preventDefault();

  var name = $('#search-name').val();
  search(name);
});
