// API Docs at:
// http://www.omdbapi.com

var keyword = '';

$('#movie-select').hide();

function search() {
  var apiPath = 'http://www.omdbapi.com/?s=';
  apiPath += escape(keyword);

    $.getJSON(apiPath).then(function(results) {

    var html = '';

    for (var i = 0; i < results.Search.length; i++) {
      var title = results.Search[i].Title;
      html += '<option value="' + title + '">' + title + '</option>';

    }

    $('#movie-select').append(html);

  });


}

$('#search').on('submit', function(evt) {

  evt.preventDefault();
  $('#movie-select').show();
  keyword = $('#movie-search').val();
  $('#movie-select').html('<option>Movies matching ' + keyword + '</option>');
  search();

});

$('#movie-select').change(function() {
  var $movie = $('#movie-select').val();
  apiPath = 'http://www.omdbapi.com/?t=';
  apiPath += escape($movie);
  var $image = '';
  var $title = '';
  var $html = '';

  $.getJSON(apiPath).then(function(results) {

    $image += results.Poster;
    $title += results.Title;

    $html += '<h1>' + $title + '</h1>';
    $html += '<img src="' + $image + '">';

    $('#movie-detail').append($html);

  });


});
