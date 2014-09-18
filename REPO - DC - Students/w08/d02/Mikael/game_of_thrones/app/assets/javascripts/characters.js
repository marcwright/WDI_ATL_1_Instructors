$(function(){

  var $boxes = $('li input[type="checkbox"]');
  bindCheckBoxes($boxes);
  bindForm();
  var $deleteButtons = $('li span');
  bindDeleteButtons($deleteButtons);

});

function bindForm() {
  var $form = $('form');
  $form.on('submit', function(evt) {
    evt.preventDefault();

    var $data = $(this).serializeObject();

    $.ajax({
      url: '/characters',
      type: 'post',
      dataType: 'json',
      data: {character: $data},
      context: this
    })
    .then(appendCharacter);

  });
}

function bindCheckBoxes(boxes) {
  boxes.change(function() {
    var character = $(this).parent();

    // console.log(character.data('character-id'));

    var dead = $(this).prop('checked');
    // console.log(dead);

    $.ajax({
      url: '/characters/' + character.data('character-id'),
      type: 'patch',
      dataType: 'json',
      data: { character: {dead: dead}}
    });

    dead ? character.addClass('dead') : character.removeClass('dead');

  });

}

function appendCharacter(character) {
  this.reset();
  var li = $('<li data-character-id="' + character.id + '">' + character.name + '</li>');
  li.append($('<input type="checkbox">'));
  li.append($('<span>&hearts;</span>'))
  $('ul').append(li);
  bindCheckBoxes(li.find('input'));
  bindDeleteButtons(li.find('span'));
}

function bindDeleteButtons(buttons) {
  buttons.on('click', function() {
    var character = $(this).parent();
    $.ajax({
      url: '/characters/' + character.data('character-id'),
      type: 'delete',
      dataType: 'json',
      context: character
    }).then(removeCharacter);
  });
}

function removeCharacter(){
  this.remove();
}
