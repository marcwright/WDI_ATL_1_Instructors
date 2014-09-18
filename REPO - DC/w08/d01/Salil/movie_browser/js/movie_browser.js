// API Docs at:
// http://www.omdbapi.com



function search() {
  var keyword = escape($('#movie-search').val());
  var apiPath = 'http://www.omdbapi.com/?s=' + keyword;
  console.log(keyword);

  $.getJSON(apiPath).then(function(results) {
    var html = '';
    for (var i=0; i < results.Search.length; i++) {
      html += '<option>' + results.Search[i].Title + '</option>';
    }
    $("#movie-select").html('<option>Movies matching ' + '"' + unescape(keyword)+ '"' + '</option>');
    $("#movie-select").append(html);
  });
}

function select() {
  var selection = $("#movie-select").val();
}

$('#search').on('submit', function(evt) {
  evt.preventDefault();
  search();
});

$('#movie-search').change(search);
