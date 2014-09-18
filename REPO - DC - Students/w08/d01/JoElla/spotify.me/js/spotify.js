
var keyword = '';

// API Docs at:
// https://developer.spotify.com/technologies/web-api/search/

// Album:


'http://ws.spotify.com/search/1/' + searchType + '.json?q=';

// Artist:
// 'http://ws.spotify.com/search/1/artist.json?q=';

// Track:
// 'http://ws.spotify.com/search/1/track.json?q=';


$('#search').on('submit', function(evt) {
  evt.preventDefault();

  keyword = $('#search-keyword').val();
  //search(keyword);

  searchType = $('#search-type').val();
  console.log(searchType);

});
