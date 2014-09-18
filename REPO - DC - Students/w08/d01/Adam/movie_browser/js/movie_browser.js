// API Docs at:
// http://www.omdbapi.com

function search() {
  var keyword = $('#movie-search').val();
  var searchType = $('#search-type').val();
  var apiPath = 'http://www.omdbapi.com/?s=';
  apiPath += escape(keyword);

  $.getJSON(apiPath).then(function(results) {

    var html = '';

    for (i = 0; i < results.Search.length; i++) {
      html += '<option>'+ results.Search[i].Title +'</option>';
    }
    $('#movie-select').append(html);
  });
}


// NOT WORKING: NEED TO RENDER BODY VIEW WITH API DATA
//function display() {
//  var keyword = $('#movie-select').val();
//  var apiPath = 'http://www.omdbapi.com/?s=';
//  apiPath += escape(keyword);
//
//  $.getJSON(apiPath).then(function(results) {
//
//  });
//}

$('#search').on('submit', function(evt) {
  var keyword = $('#movie-search').val();
  evt.preventDefault();
  $('#movie-select').html('<option>Movies Matching '+ keyword+'</option>');
  search();
});

$('#search-type').change(search);



// Jquery to show or hide subQuestion

$(document).ready(function(){
  // do your checks of the radio buttons here and show/hide what you want to
  $("#movie-detail").hide();

  $(document).on('click', '#movie-select' , function() {
         if ($(this.value).length > 0){
            $("#movie-detail").show();
         }
         else {
            $("#movie-detail").hide();
         }
    })

});

