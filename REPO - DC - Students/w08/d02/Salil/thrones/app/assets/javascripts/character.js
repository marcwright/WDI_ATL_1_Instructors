$(function() {
  var $boxes = $('li input[type="checkbox"]');
  var $form = $('form');
  var $deleteButtons = $('li span');
  bindCheckBoxes($boxes);
  bindForm($form);
  bindDeleteButtons($deleteButtons);
});



function bindCheckBoxes(boxes) {
  boxes.on('change', function(){
    var character = $(this).parent();

    var dead = $(this).prop('checked');

    $.ajax({
      url: '/characters/' + character.data('character-id'),
      type: 'patch',
      dataType: 'json',
      data: {character: {is_dead: dead}}
    });

    character.toggleClass('dead');

  });//Event Listener
}

function bindForm(form){
  form.on('submit', function(evt){
    evt.preventDefault();

    var data = $(this).serializeObject();
    console.log(data);

    $.ajax({
      url: '/characters',
      type: 'post',
      dataType: 'json',
      data: {character: data},
      context: this
    }).then(appendCharacter);
  })
}

function bindDeleteButtons(buttons){
  buttons.on('click', function(){
    var character = $(this).parent();

    $.ajax({
      url: '/characters/' + character.data('character-id'),
      type: 'delete',
      dataType: 'json',
      context: character
    }).then(function(){
      this.remove();
    })
  });
}

function appendCharacter(character) {
  var li = $('<li data-character-id="' + character.id + '" >' + character.name + '</li>');
  li.append($('<input type="checkbox">'));
  $('ul').append(li);
  bindCheckBoxes(li.find('input'));
}
