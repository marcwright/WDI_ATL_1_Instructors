// API Docs at:
// http://www.omdbapi.com

// Global
$('select').css('display', 'none');
var $movieDetail = $('#movie-detail');
var $movieSearch = $('#movie-search');
var $movieSelect = $('#movie-select');

// Search the omdb api
function search(){
  var keyword = $('#movie-search').val();
  var apiPath = 'http://www.omdbapi.com/?s=' + escape(keyword);
  $.getJSON(apiPath).then(function(results){
    var html = '';

    // go through all results
    for (i = 0; i < results.Search.length; i++){
      html += '<option>' + results.Search[i].Title + '</option>';
    }
    $movieSelect.append(html);
  });
}

// search results show up in the select menu
$('#search').on('submit', function(evt){
  evt.preventDefault();
  $movieSelect.html('<option>Movies matching ' + $movieSearch.val() + '</option>');
  $movieSelect.fadeIn(500);
  search();
});

// display movie details when option is selected
$movieSelect.on('change', function(){
  movieChoice = $movieSelect.val();
  path = 'http:www.omdbapi.com/?t='
  path += escape(movieChoice);

  var moviePoster = '';
  var movieTitle = '';

  $.getJSON(path).then(function(data){
    movieTitle += '<h1>' + data.Title + '</h1>';
    moviePoster += '<img src="' + data.Poster + '">';
      $('#movie-detail').append(movieTitle, moviePoster);
  })
})
