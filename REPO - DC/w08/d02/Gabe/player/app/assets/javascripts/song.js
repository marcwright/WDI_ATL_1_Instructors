 // Run code after the DOM has loaded
$(function(){
  var $boxes = $('li input[type="checkbox"]');
  bindCheckBoxes($boxes);

  bindForm();

  var $deleteButtons = $('li span');
  bindDeleteButtons($deleteButtons);
});

function bindCheckBoxes(boxes){
   boxes.on('change', function(){
    var song = $(this).parent();
    var dead = $(this).prop('checked');

    // console.log(character.data('character-id'));
    // console.log(dead);

    $.ajax({
      url: '/songs/' + song.data('song-id'),
      type: 'patch',
      dataType: 'json',
      data: {song: {dead: dead}}
    });

    song.toggleClass('dead');
    // dead ? character.addClass('dead') : character.removeClass('dead');

  });
}

function bindForm(){
  var $form = $('form')
  $form.on('submit', function(evt){
    evt.preventDefault();

    var data = $(this).escape;

     // HERE I am trying to run an apple api search:
    var apiPath = 'https://itunes.apple.com/search?term=' + data + '&entity=musicTrack';

    var trackData = $.getJSON(apiPath);
    console.log(trackData);

    //HERE i need to dig into the result, and get the song title, artist and preview url...
    //TO BE DONE????

    //THEN, I can add that new song info to my database HERE:
    $.ajax({
      url: '/songs',
      type: 'POST',
      dataType: 'json',
      data: {character: data},
      context: this
    }).then(appendCharacter);

  });
}


function appendSong(song){
  // console.log(character);
  // console.log(this);
  this.reset();
  var li = $('<li data-song-id="' + song.id + '" >' + song.title + song.artist + '</li>');
  li.append($('<input type="checkbox">'));
  li.append($('<span>&hearts;</span>'));
  $('ul').append(li);
  bindCheckBoxes(li.find('input'));
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
