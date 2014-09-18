// API Docs at:
// https://developer.spotify.com/technologies/web-api/search/

// Album:
// 'http://ws.spotify.com/search/1/album.json?q=';

// Artist:
// 'http://ws.spotify.com/search/1/artist.json?q=';

// Track:
// 'http://ws.spotify.com/search/1/track.json?q=';

//var searchType = $('#search-type').change(function() {$(this).val()});
var keyword = '';

function search(query) {
  var searchType = $('#search-type').val();
  var apiPath = 'http://ws.spotify.com/search/1/' + searchType + '.json?q=' + escape(query);

  $.getJSON(apiPath).then(function(results) {

    var html = '';

    for (var i = 0; i < results[searchType + 's'].length; i++) {
      html += ['<li>', results[searchType + 's'][i].name, '</li>'].join('');
    }

    $('#results').html(html);

  });
}

$('#search').on('submit', function(evt) {
  evt.preventDefault();
  keyword = $('#search-keyword').val();
  search(keyword);
});
