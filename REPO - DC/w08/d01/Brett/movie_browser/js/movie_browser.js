// API Docs at:
// http://www.omdbapi.com

var keyword = "";

function search() {
  var apiPath = "http://www.omdbapi.com/?s="
  apiPath += escape(keyword);

  $.getJSON(apiPath).then(function(movies) {
    var movie = "";

    for (var i=0; i < movies.Search.length; i++) {
      movie += "<option value=" + movies.Search[i].imdbID + ">" + movies.Search[i].Title + " - " + movies.Search[i].Year + "</option>";
    }

    $("#movie-select").html(movie);
    $("#movie-select").prepend("<option value='movie-default'> Movies matching '" + keyword + "'…</option>");
  });
}

$("#search").on("submit", function(event) {
  event.preventDefault();

  keyword = $("#movie-search").val();

  search();
});

$("#movie-select").on("change", function() {
  var apiPath = "http://www.omdbapi.com/?i="
  apiPath += $("#movie-select").val();

  $.getJSON(apiPath).then(function(movie) {
    var movie = "<h2>" + movie.Title + "</h2><br><img src=" + movie.Poster + ">";

    $("#movie-detail").html(movie);
  });
});
