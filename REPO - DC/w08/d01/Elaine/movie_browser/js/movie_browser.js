// API Docs at:
// http://www.omdbapi.com
var keyword = '';
var $movieSelection = $("#movie-select");
var movieID = '';

function search() {
  var apiPath = 'http://www.omdbapi.com/?s=';
  apiPath += escape(keyword);

  $.getJSON(apiPath).then(function(data) {
    var titles = '<option>Movies matching "' + keyword + '"</option>';

    for (var i=0; i < data["Search"].length; i++) {
      titles += '<option value="'+ data["Search"][i]["imdbID"] + '">' + data["Search"][i]["Title"] + '</option>';
    }

    $movieSelection.html(titles);
  })

  $movieSelection.show();
};

function searchDetails() {
  var apiPath2 = 'http://www.omdbapi.com/?i=';
  apiPath2 += movieID;


  $.getJSON(apiPath2).then(function(data) {
    var selectedTitle = '<h2>'+ data["Title"] + '</h2>';
    var posterUrl = '<img src="' + data["Poster"] + '">';

    $('#movie-detail').html(selectedTitle + posterUrl);
  });
};


$('#search').on('submit', function(evt) {
  evt.preventDefault();

  keyword = $('#movie-search').val();
  search();
})

$movieSelection.on('change', function() {

  movieID = $movieSelection.val();
  searchDetails();
});

$movieSelection.hide();
