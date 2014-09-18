// API Docs at:
// https://developer.spotify.com/technologies/web-api/search/
function search(){
  var keyword = $('#search-keyword').val();
  var searchType = $('#search-type').val();
  var apiPath = 'http://ws.spotify.com/search/1/'+searchType+'.json?q='+keyword;

  $.getJSON(apiPath).then(function(results){
    var html = '';
    for (i = 0; i < results[searchType+'s'].length; i++){
      html += '<li>' + results[searchType+'s'][i].name + '</li>';
    }
    $('#results').html(html);
  });
}

$('#search').on('submit', function(evt){
  evt.preventDefault();
  search();
});

$('#search-type').change(search);






// // Album:
// // 'http://ws.spotify.com/search/1/album.json?q=';
// function searchByAlbum(keyword){
//   var apiPath = 'http://ws.spotify.com/search/1/album.json?q='
//   apiPath += keyword;
//   html = '';
//   $.getJSON(apiPath).then(function(results){
//      for (i = 0; i < results.albums.length; i++){
//       html += '<li>' + results.albums[i].name + '</li>';
//      };
//      $('#results').append(html);
//   });
// }

// // Track:
// // 'http://ws.spotify.com/search/1/track.json?q=';
// function searchByTrack(keyword){
//   var apiPath = 'http://ws.spotify.com/search/1/track.json?q='
//   apiPath += keyword;
//   $.getJSON(apiPath).then(function(results){
//     html = '';
//      for (i = 0; i < results.tracks.length; i++){
//       html += '<li>' + results.tracks[i].name + '</li>';
//      };
//      $('#results').append(html);
//   });
// }

// // Artist:
// // 'http://ws.spotify.com/search/1/artist.json?q=';
// function searchByArtist(keyword){
//   var apiPath = 'http://ws.spotify.com/search/1/artist.json?q='
//   apiPath += keyword;
//   $.getJSON(apiPath).then(function(results){
//     html = '';
//      for (i = 0; i < results.artists.length; i++){
//       html += '<li>' + results.artists[i].name + '</li>';
//      };
//       $('#results').append(html);
//   });

// }



    // if (searchType === 'album'){
    //   searchByAlbum(keyword);
    // } else if (searchType === 'track'){
    //   searchByTrack(keyword);
    // } else if (searchType === 'artist'){
    //   searchByArtist(keyword);
    // };



