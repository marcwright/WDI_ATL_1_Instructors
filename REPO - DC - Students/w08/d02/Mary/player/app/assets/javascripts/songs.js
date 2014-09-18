$(function() {
  bindForm();

  var $deleteButtons = $('li span');
  bindDeleteButtons($deleteButtons);

});
/////////////////
function bindForm() {
  var $form = $('form')
  $form.on('submit',function(evt) {
    evt.preventDefault();
    var $data = $(this).serializeObject();
    var apiPath = 'https://itunes.apple.com/search?term="' + $data.title + '"'
    $.ajax( {
      url: apiPath,
      dataType: 'jsonp',
      type: 'get'
    }).then(function(songs) {
      var results = songs.results[0]
      var title = songs.results[0].trackName
      var artist = songs.results[0].artistName
      var previewUrl = songs.results[0].previewUrl

    $.ajax({
      url: '/songs',
      type: 'post',
      dataType: 'json',
      data: {song: {title: title, artist: artist, preview_url: previewUrl}},
      context: results
    }).then(appendSong)
  });
});
}


function appendSong(song) {
  var $li = $('<li data-song-id="' + song.id + '">' + song.title + ', by ' + song.artist + '<br><audio controls><source src="' + song.preview_url + '"></audio></li>');
  $li.append($('<span>&times;</span>'));
  $('ul').append($li);
  bindDeleteButtons($li.find('span'))
}

function bindDeleteButtons(buttons) {
  buttons.on('click', function() {
    var $song = $(this).parent();
    $.ajax({
      url: '/songs/' + $song.data('song-id'),
      type: 'delete',
      dataType: 'json',
      context: $song
    }).then(removeSong)
  });
}

function removeSong() {
  this.remove();
}
