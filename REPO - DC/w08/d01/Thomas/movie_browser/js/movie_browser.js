// API Docs at:
// http://www.omdbapi.com

var keyword;
var userChoice;
$('#movie-select').hide();

function search(query) {
  var apiPath = 'http://www.omdbapi.com/?s=' + escape(query);
  $.getJSON(apiPath).then(function(response) {

//why does it not seem to matter if I store an initial value in titles?
    var titles = '';

    for (var i = 0; i < response.Search.length; i++) {
      titles += ['<option>', response.Search[i].Title, '</option>'].join('');
    }
    $('#movie-select').append(titles);
  });
}

function getDetails(query) {
  var apiPath = 'http://www.omdbapi.com/?t=' + escape(query);
  $.getJSON(apiPath).then(function(response) {
    $('#movie-detail').html('<h2>' + response.Title + '</h2>' + '<img src="' + response.Poster + '">')
  });
}

$('#search').on('submit', function(evt) {
  evt.preventDefault();
  keyword = $('#movie-search').val();
  $('#movie-select').show();
  search(keyword);
});

$('#movie-select').on('change', function(evt) {
  evt.preventDefault();
  userChoice = $('#movie-select').val();
  getDetails(userChoice);
});
