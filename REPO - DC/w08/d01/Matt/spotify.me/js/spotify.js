function search(){
  var keyword = $('#search-keyword').val();
  var searchType = $('#search-type').val();
  var apiPath = 'http://ws.spotify.com/search/1/'+searchType+'.json?q='+keyword;

  $.getJSON(apiPath).then(function(results){
    var html = '';
    var typeValue = searchType+'s';
    for (i = 0; i < results[typeValue].length; i++){
      html += '<li>' + results[typeValue][i].name + '</li>';
    }
    $('#results').html(html);
  });
}

$('#search').on('submit', function(evt){
  evt.preventDefault();
  search();
});

$('#search-type').change(search);


// // API Docs at:
// // https://developer.spotify.com/technologies/web-api/search/

// // Album:
// // 'http://ws.spotify.com/search/1/album.json?q=';

// // Artist:
// // 'http://ws.spotify.com/search/1/artist.json?q=';

// // Track:
// // 'http://ws.spotify.com/search/1/track.json?q=';


// var keyword = '';
// var offset = 0;

// var $search = $("#search-type").val()

// function searchAlbum() {
//   var apiPath = 'http://ws.spotify.com/search/1/album.json?q=';
//   apiPath += escape(keyword);
//   // apiPath += '&offset=' + offset;

//   $.getJSON(apiPath).then(function(albumResults) {

//     var html = '';

//     for (var i=0; i < albumResults.albums.length; i++) {
//       offset += 1;
//       html += '<p>'+ albumResults.albums[i].name +'</p>';
//     }

//     $("body").append(html);
//   });
// }

// function searchArtist() {
//   var apiPath = 'http://ws.spotify.com/search/1/artist.json?q=';
//   apiPath += escape(keyword);
//   // apiPath += '&offset=' + offset;

//   $.getJSON(apiPath).then(function(artistResults) {

//     var html = '';

//     for (var i=0; i < artistResults.artists.length; i++) {
//       offset += 1;
//       html += '<p>'+ artistResults.artists[i].name +'</p>';
//     }

//     $("body").append(html);
//   });
// }

// function searchTrack() {
//   var apiPath = 'http://ws.spotify.com/search/1/track.json?q=';
//   apiPath += escape(keyword);
//   // apiPath += '&offset=' + offset;

//   $.getJSON(apiPath).then(function(artistResults) {

//     var html = '';

//     for (var i=0; i < artistResults.tracks.length; i++) {
//       offset += 1;
//       html += '<iframe src="https://embed.spotify.com/?uri=' + artistResults.tracks[i].href + '" width="300" height="380" frameborder="0" allowtransparency="true"></iframe>'
//                 + '<p>'
//                 + artistResults.tracks[i].name
//                 + '<br>'
//                 + artistResults.tracks[i].album.name
//                 + '</p>'
//               ;
//     }

//     $("body").append(html);
//   });
// }


// $('#search').on('submit', function(evt) {
//   evt.preventDefault();

//   keyword = $('#search-keyword').val();
//   offset = 0;

//   if ($search == 'album') {
//     return searchAlbum();
//   } else if ($search == 'artist') {
//     return searchArtist();
//   } else if ($search == 'track') {
//     return searchTrack();
//   }

// });

// $('#search-keyword').on('change', function(evt) {
//   evt.preventDefault();

//   keyword = $('#search-keyword').val();
//   offset = 0;

//   if ($search == 'album') {
//     return searchAlbum();
//   } else if ($search == 'artist') {
//     return searchArtist();
//   } else if ($search == 'track') {
//     return searchTrack();
//   }

//   $search = $(this).val();
// });

// $(window).on('scroll', _.debounce(function() {
//   if ($(window).scrollTop() + $(window).height() >= $(document).height()) {
//     search();
//   }
// }, 200));



// function searchAll() {
//   var apiPath = "http://ws.spotify.com/search/1/" + $search + ".json?q=";
//   apitPath += escape(keyword);


// }
