$(function(){

  var $boxes = $('li input[type="checkbox"]');
  bindCheckBoxes($boxes);
  bindForm();

  var $deleteButtons = $('li span');
  bindDeleteButtons($deleteButtons)
});


///////////////// Functions ///////////////////////////
function bindCheckBoxes(boxes){
   boxes.on('change', function(){
    var character = $(this).parent();
    var dead = $(this).prop('checked');

    $.ajax({
      url: '/characters/' + character.data('character-id'),
      type: 'patch',
      dataType: 'json',
      data: {character: {dead: dead}}
    });
    character.toggleClass('dead');
  });
}

function appendCharacter(character){
  this.reset();
  var li = $('<li data-character-id="' + character.id + '" >' + character.name + '</li>');
  li.append($('<input type="checkbox">'));
  li.append($('<span>&times;</span>'));
  $('ul').append(li);
  bindCheckBoxes(li.find("input"));
  bindDeleteButtons(li.find("input"))
  }

function bindForm(){
  var $form = $('form');
  $form.on('submit', function(evt){
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
  });
}

function bindDeleteButtons(buttons){
  buttons.on('click', function(){
    var character = $(this).parent();

    $.ajax({
      url: '/characters/'+ character.data('character-id'),
      type: 'delete',
      dataType: 'json',
      context: character
    }).then(removeCharacter);
  });
}

function removeCharacter(){
  this.remove();
}
