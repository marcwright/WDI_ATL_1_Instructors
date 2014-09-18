// API Docs at: 
// https://developer.spotify.com/technologies/web-api/search/

// Album:
// 'http://ws.spotify.com/search/1/album.json?q=';

// Artist:
// 'http://ws.spotify.com/search/1/artist.json?q=';

// Track:
// 'http://ws.spotify.com/search/1/track.json?q=';

var keyword = '';
//var offset = 0;

function search(keyword) {
  var searchType = $("#search-type").val();
  var apiPath = 'http://ws.spotify.com/search/1/'+ searchType + '.json?q=' + escape(keyword);

  $.getJSON(apiPath).then(function(results) {
    var html = '';  
    //console.log(results);

    for (var i=0; i < results[searchType + 's'].length; i++) {
      //offset += 1;
      html += '<li>'+ results[searchType + 's'][i].name +'</li>';
      //html += '<img src="'+ album.data[i].images.original.url +'" alt="" data-index="'+offset+'">';
    }

    $("#results").html(html);
  });
}

$('#search').on('submit', function(evt) {
  evt.preventDefault();

  keyword = $('#search-keyword').val();
  search(keyword);

});

$('#search-type').on("change", function(evt) {
  // evt.preventDefault();
  keyword = $('#search-keyword').val();
  search(keyword);
});
