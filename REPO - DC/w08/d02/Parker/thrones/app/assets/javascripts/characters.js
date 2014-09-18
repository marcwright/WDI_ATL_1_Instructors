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
    var character = $(this).parent();
    var dead = $(this).prop('checked');
    
    // console.log(character.data('character-id'));
    // console.log(dead);

    $.ajax({
      url: '/characters/' + character.data('character-id'),
      type: 'patch',
      dataType: 'json',
      data: {character: {dead: dead}}
    });

    character.toggleClass('dead');
    // dead ? character.addClass('dead') : character.removeClass('dead');

  });
}

function bindForm(){
  var $form = $('form')
  $form.on('submit', function(evt){
    evt.preventDefault();

    var data = $(this).serializeObject();
    console.log(data);

    $.ajax({
      url: '/characters',
      type: 'POST',
      dataType: 'json',
      data: {character: data},
      context: this
    }).then(appendCharacter);
  });
}


function appendCharacter(character){
  // console.log(character);
  // console.log(this);
  this.reset();
  var li = $('<li data-character-id="' + character.id + '" >' + character.name + '</li>');
  li.append($('<input type="checkbox">'));
  li.append($('<span>&hearts;</span>'));
  $('ul').append(li);
  bindCheckBoxes(li.find('input'));
  bindDeleteButtons(li.find('span'));
}

function bindDeleteButtons(buttons){
  buttons.on('click', function(){
    var character = $(this).parent();

    $.ajax({
      url: '/characters/' + character.data('character-id'),
      type: 'delete',
      dataType: 'json',
      context: character
    }).then(removeCharacter)
  });
}

function removeCharacter(){
  // console.log(this);
  this.remove();
}