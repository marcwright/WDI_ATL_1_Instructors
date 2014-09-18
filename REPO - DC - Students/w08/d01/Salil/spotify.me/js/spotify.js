// API Docs at:
// https://developer.spotify.com/technologies/web-api/search/

// Album:
// 'http://ws.spotify.com/search/1/album.json?q=';

// Artist:
// 'http://ws.spotify.com/search/1/artist.json?q=';

// Track:
// 'http://ws.spotify.com/search/1/track.json?q=';


function search() {
  var keyword = escape($('#search-keyword').val());
  var searchType = $("#search-type").val();
  var apiPath = 'http://ws.spotify.com/search/1/' + searchType + '.json?q=' + keyword;

  $.getJSON(apiPath).then(function(results) {
    var html = '';

    for (var i=0; i < results[searchType + 's'].length; i++) {
      html += '<li>' + results[searchType + 's'][i].name + '</li>';
    }

    $("#results").html(html);
  });
}

$('#search').on('submit', function(evt) {
  evt.preventDefault();
  search();
});

$('#search-type').change(search);
