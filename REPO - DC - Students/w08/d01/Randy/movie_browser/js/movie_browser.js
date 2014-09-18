// API Docs at:
// http://www.omdbapi.com
var movieSelect = $('#movie-select');
var movieDeets = $('#movie-detail');
movieSelect.hide();

function searchForMovies(){
  var movie = $('#movie-search').val();
  var apiPath = 'http://www.omdbapi.com/?s='+escape(movie);

  $.getJSON(apiPath).then(function(results){
    var html = '<option value="placeholder">'+'Movies Matching '+ movie+ '</option>';

    for (var i = 0; i < results.Search.length; i++){
      var id = results.Search[i].imdbID;
      html += '<option value="' + id + '">'+ results.Search[i].Title+ '</option>'
    }

    movieSelect.html(html).show();
  });
}

function searchForTitle(){
  var html = '';
  var imdbId = movieSelect.val();
  var apiPath = 'http://www.omdbapi.com/?i='+imdbId;

  $.getJSON(apiPath).then(function(result){
    html = '<h1>'+result.Title+'</h1>'+ '<img src="'+result.Poster+'">' + '<p>'+result.Plot+'</p>';

    movieDeets.html(html);
  });
}

$('#search').on('submit', function(evt){
  evt.preventDefault();
  searchForMovies();
});

movieSelect.change(searchForTitle);
