// API Docs at:
// http://www.omdbapi.com

var $selectDropdown = $('#movie-select')
$selectDropdown.hide();

$('#search').on('submit', function(evt) {
  evt.preventDefault();
  var keyword = $('#movie-search').val();
  var apiPath = "http://www.omdbapi.com/?s=" + escape(keyword);
  $.getJSON(apiPath).then(function(movies) {
    $selectDropdown.html('');
    for (var i = 0; i < movies.Search.length; i++) {
      $selectDropdown.show();
      $selectDropdown.val($("#movie-select option:first").text('MOVIES MATCHING: ' + keyword));
      $selectDropdown.append( '<option value="' + movies.Search[i].Title + '">' + movies.Search[i].Title + '</option>');
    }
  });
});

$selectDropdown.on('change',function() {
  var $selectedMovie = $('#movie-select option:selected')[0].innerHTML;
  var apiPath = "http://www.omdbapi.com/?t=" + escape($selectedMovie);
  $.getJSON(apiPath).then(function(movie) {
    var $movieDetails = $('<p>' + movie.Title + '</p><br><img src=' + movie.Poster + '>')
    $('#movie-detail').html($movieDetails);
  })
});

