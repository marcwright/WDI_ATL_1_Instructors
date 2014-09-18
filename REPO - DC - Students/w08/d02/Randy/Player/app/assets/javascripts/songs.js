$(function(){

var artist = $("label input[name='artist']");
var song = $("label input[name='song']")

    $.ajax({
      url: '"https://itunes.apple.com/search?term='+ artist + '+' + song +'&media=music&entity=musicTrack&limit=1"',
      type: 'get',
      dataType: 'json'
    }).then(function(song){
      var artistName = song.results[0].artistName;
      var songName = song.results[0].trackName;
      var previewUrl = song.results[0].previewUrl;
    })



});


