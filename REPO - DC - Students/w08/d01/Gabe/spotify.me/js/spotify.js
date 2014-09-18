// API Docs at:
// https://developer.spotify.com/technologies/web-api/search/

// Album:
// 'http://ws.spotify.com/search/1/album.json?q=';

// Artist:
// 'http://ws.spotify.com/search/1/artist.json?q=';

// Track:
// 'http://ws.spotify.com/search/1/track.json?q=';

var keyword = '';
var offset = 0;
var indicator = '';

function search() {
  if ($('#search-type').val() === "track"){
    indicator = "track";
    var apiPath = 'http://ws.spotify.com/search/1/track.json?q=';
    apiPath += escape(keyword);
  }
  else if ($('#search-type').val() === "artist"){
    indicator = "artist";
    var apiPath = 'http://ws.spotify.com/search/1/artist.json?q=';
    apiPath += escape(keyword);
  }
  else if ($('#search-type').val() === "album"){
    indicator = "album";
    var apiPath = 'http://ws.spotify.com/search/1/album.json?q=';
    apiPath += escape(keyword);
  }



  $.getJSON(apiPath).then(function(names) {

    var html = '';

    if (indicator === "album"){
      for (var i=0; i < names.albums.length; i++) {
        //offset += 1;
        html += '<li>'+ names.albums[i].name + '</li>';
      }}

    else if (indicator === "track"){
      for (var i=0; i < names.tracks.length; i++) {
        //offset += 1;
        html += '<li>'+ names.tracks[i].name + '</li>';
      }}

    else if (indicator === "artist"){
      for (var i=0; i < names.artists.length; i++) {
        //offset += 1;
        html += '<li>'+ names.artists[i].name + '</li>';
      }}

    $("#results").html(html);
  });
}
//apiReply["responseJSON"]["albums"][0]["name"]


$('#search').on('submit', function(evt) {
  evt.preventDefault();

  keyword = $('#search-keyword').val();
  //offset = 0;

  search();
});


$(window).on('scroll', _.debounce(function() {
  if ($(window).scrollTop() + $(window).height() >= $(document).height()) {
    search();
  }
}, 200));

$('body').on('click', 'img', function() {
  $(this).toggleClass('big');
});
