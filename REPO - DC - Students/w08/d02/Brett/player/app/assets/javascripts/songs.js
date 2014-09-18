$(function(){

  bindForm();

  var $deleteButtons = $('li span');
  bindDeleteButtons($deleteButtons);
});

function bindForm(){
  var $form = $('form')
  $form.on('submit', function(evt){
    evt.preventDefault();

    var data = $(this).serializeObject();
    console.log(data);

    $.ajax({
      url: '/songs',
      type: 'POST',
      dataType: 'json',
      data: {song: data},
      context: this
    }).then(appendSong);
  });
}

function appendSong(song){
  // console.log(character);
  // console.log(this);
  this.reset();
  var li = $('<li data-song-id="' + song.id + '" >' + song.title + '</li>');
  li.append($('<input type="checkbox">'));
  li.append($('<span>&hearts;</span>'));
  $('ul').append(li);
  bindCheckBoxes(li.find('input'));
  bindDeleteButtons(li.find('span'));
}

function bindDeleteButtons(buttons){
  buttons.on('click', function(){
    var song = $(this).parent();

    $.ajax({
      url: '/songs/' + song.data('song-id'),
      type: 'delete',
      dataType: 'json',
      context: song
    }).then(removeSong)
  });
}

function removeSong(){
  // console.log(this);
  this.remove();
}
