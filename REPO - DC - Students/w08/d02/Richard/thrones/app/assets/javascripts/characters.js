/*
* @Author: Richard Hessler
* @Date:   2014-06-10 11:53:14
* @Last Modified by:   Richard Hessler
* @Last Modified time: 2014-06-10 17:53:29
*/

$(function(){
   var $boxes = $('li input[type="checkbox"]');
   bindCheckBoxes($boxes);
   var $form = $('form');
   bindForm($form);
   var $deleteButtons = $('li span');
   bindDeleteButtons($deleteButtons);

});


//
function bindCheckBoxes(boxes){
  boxes.on('change', function(){
    var character = $(this).parent();

    var dead = $(this).prop('checked');

    $.ajax({
      url: '/characters/' + character.data('character-id'),
      type: 'PATCH',
      dataType: 'json',
      data: {character:{is_dead: dead}}

    });
    character.toggleClass('dead');
    // dead ? character.addClass('dead') : character.removeClass('dead')
  });
}


// appending character to <ul>
function appendCharacter(character){
  this.reset();
  var li = $('<li data-character-id="'+character.id + '" >' + character.name+ '</li>');
  li.append($('<input type="checkbox">'));
  li.append($('<span>&hearts;</span>'));
  $('ul').append(li);
  bindCheckBoxes(li.find('input'));
}



//form function for AJAX request (adding character to db)
function bindForm(form){
  form.on('submit', function(e) {
      e.preventDefault();

      var data = $(this).serializeObject();
      console.log(data);

      $.ajax({
        url: '/characters/',
        type: 'POST',
        dataType: "json",
        data: {character: data},
        context: this
      }).then(appendCharacter)
   });
}


//binding &heart; to button that removes <li>
function bindDeleteButtons(buttons){
  buttons.on('click', function(){
    var character = $(this).parent();

    $.ajax({
      url: '/characters/' + character.data('character-id'),
      type: 'DELETE',
      dataType: 'json',
      context: character
    }).then(removeCharacter)
  });
}


function removeCharacter(){
  this.remove();
}
