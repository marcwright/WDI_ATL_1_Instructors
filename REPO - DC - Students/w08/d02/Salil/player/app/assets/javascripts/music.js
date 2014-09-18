$(function() {
  var $song = $('label input[name="song"]');
  var $artist = $('label input[name="artist"]');
})

function search() {
  var apiPath = 'https://itunes.apple.com/search?term='
  apiPath += escape($artist);
  apiPath += escape($song);
  apiPath += '$limit=1'
  $.getJSON(apiPath).then(function(results){
    var list = ' '
    list +=
  })
}
