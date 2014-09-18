var keyword = '';
var page = 1;

$('#search').on('submit', function(evt) {
  evt.preventDefault();
  keyword = $('#search-keyword').val();
  search();
});


$('#search-type').on('change', function() {
  search();
});


$('#next-page-link').on('click', function(){
  page++;
  search();
})


function search() {
  if ($('#search-type').val() === "album"){
    albumSearch(keyword);
  } else if ($('#search-type').val() === "artist") {
    artistSearch(keyword);
  } else if ($('#search-type').val() === "track") {
    trackSearch(keyword);
  }
}

function albumSearch(keyword) {
  var numberOfResults = 0
  var offset = 0
  var apiPath = "http://ws.spotify.com/search/1/album.json?q=" + escape(keyword) + "&page=" + page;
  $.getJSON(apiPath).then(function(albums) {
    var html = '';
    numberOfResults = albums.info.num_results;
    offset = albums.info.offset
    for(var i=0; i < albums.albums.length; i++) {
      html += '<li><a href="' + albums.albums[i].href + '">' + albums.albums[i].name + '</a></li>';
    }
    $('#results').html(html);
    $('#results').prepend('<p>Showing ' + offset + '-' + (offset + 100) + ' results of ' + numberOfResults + '.</p>');
    $('#results').prepend('<a href="" id="next-page-link">Next Page</a>')
  })
}

function artistSearch(keyword) {
  var numberOfResults = 0
  var offset = 0
  var apiPath = "http://ws.spotify.com/search/1/artist.json?q=" + escape(keyword) + "&page=" + page;
  $.getJSON(apiPath).then(function(artists) {
    var html = '';
    numberOfResults = artists.info.num_results;
    offset = artists.info.offset
    for(var i=0; i < artists.artists.length; i++) {
      html += '<li><a href="' + artists.artists[i].href + '">' + artists.artists[i].name + '</a></li>';
    }
    $('#results').html(html);
    $('#results').prepend('<p>Showing ' + offset + '-' + (offset + 100) + ' results of ' + numberOfResults + '.</p>');
    $('#results').prepend('<a href="" id="next-page-link">Next Page</a>')
  })

}

function trackSearch(keyword) {
  var numberOfResults = 0
  var offset = 0
  var apiPath = "http://ws.spotify.com/search/1/track.json?q=" + escape(keyword) + "&page=" + page;
  $.getJSON(apiPath).then(function(tracks) {
    var html = '';
    numberOfResults = tracks.info.num_results;
    offset = tracks.info.offset
    for(var i=0; i < tracks.tracks.length; i++) {
      html += '<li><a href="' + tracks.tracks[i].href + '">' + tracks.tracks[i].name + '</a></li>';
    }
    $('#results').html(html);
    $('#results').prepend('<p>Showing ' + offset + '-' + (offset + 100) + ' results of ' + numberOfResults + '.</p>');
    $('#results').prepend('<a href="" id="next-page-link">Next Page</a>')
  })


}
