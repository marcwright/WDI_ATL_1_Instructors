// API Docs at:
// http://www.omdbapi.com
var keyword = '';
var movie = '';

$('#search').on('submit', function(evt){
  evt.preventDefault();
  keyword = $('#movie-search').val();
  search(keyword);
  $('#movie-select').show();
});

function search(keyword){
  var apiPath = 'http:www.omdbapi.com/?s='
  apiPath += escape(keyword);

  var movieTitle = '';

  $.getJSON(apiPath).then(function(data){
    for (var i=0; i < data.Search.length; i++){
    movie += data.Search[i];
    movieTitle += '<option value>' + data.Search[i].Title; + '</option>'
    }

    $('#movie-select').append(movieTitle);
  })
}

$('#movie-select').on('change', function(){
  movieChoice = $('#movie-select :selected').text();
  path = 'http:www.omdbapi.com/?t='
  path += escape(movieChoice);

  var moviePoster = '';

  $.getJSON(path).then(function(data){

    moviePoster += '<img src="' + data.Poster + '">';
    console.log(moviePoster);
      $('#movie-detail').append(moviePoster);

  })
})
