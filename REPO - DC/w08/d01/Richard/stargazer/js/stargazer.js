
function search(name) {
  // escape cleans up URL submissions: "herro world" => "herro%20world"
  var apiPath = 'http://www.strudel.org.uk/lookUP/json/?name='+ escape(name);
  // requires "jsonp" datatype.

  //takes url and settings
  $.ajax({
    //path
    url: apiPath,
    dataType: 'jsonp'
    // CRUD Actions
    // method: 'get',

    // when done
    // success: function(data){
    //   console.log(data);
    // },
    // // if failed
    // error: function(){
    //   console.log('I failed D:.');
    // }
  })
    .then(function(data){
      if (data.image.src.indexOf('//') === 0) {
        data.image.src = 'http:' + data.image.src;
      }
     $('#preview').html('<img src="'+data.image.src+'">');
    })
    .fail(function(data) {
      console.log(data);
    });
}

$('#search').on('submit', function(event) {
  event.preventDefault();

  var name = $('#search-name').val();
  search(name);
})
