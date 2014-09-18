/*
* @Author: Richard Hessler
* @Date:   2014-06-10 16:37:22
* @Last Modified by:   Richard Hessler
* @Last Modified time: 2014-06-10 17:53:26
*/


$(function(){
   // var $boxes = $('li input[type="checkbox"]');
   // bindCheckBoxes($boxes);
   var $form = $('form');
   bindForm($form);
   // var $deleteButtons = $('li span');
   // bindDeleteButtons($deleteButtons);

});

function appendSong(song){
  this.reset();
  var li = $('<li data-character-id="'+song.id + '" >' + song.song_title+ ' by ' + song.artist +' <audio controls> <source src="' + song.preview_url +' </audio> </li>');
  li.append($('<span>&times;</span>'));
  $('ul').append(li);
}

function bindForm(form){
  var $artist = $('label input[name="artist"]')
  var $song = $('label input[name="song_title"]')

  // var data = $(this).serializeObject();
  form.on('submit', function(e) {
      e.preventDefault();
      $.ajax({
        url: 'https://itunes.apple.com/search?term='+$artist+$song+'&media=music&entity=musicTrack&limit=1',
        type: 'GET',
        dataType: "jsonp",
        // context: this
      }).then(function(song){
        var artist = results[0].artistName;
        var song = results[0].trackName;
        var previewUrl = results[0].previewUrl;
      })
   });
}

function bindForm(form){
  form.on('submit', function(e) {
      e.preventDefault();

      var data = $(this).serializeObject();

      $.ajax({
        url: '/characters/',
        type: 'POST',
        dataType: "json",
        data: {character: data},
        context: this
      }).then(appendCharacter)
   });
}
