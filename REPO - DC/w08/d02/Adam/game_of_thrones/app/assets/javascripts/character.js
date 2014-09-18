 // Run code after the DOM has loaded
$(function(){
  var $boxes = $('li input[type="checkbox"]');
  bindCheckBoxes($boxes);

  var $form = $('form')
  $form.on('submit', function(evt) {
    evt.preventDefault();

    var data = $(this).serializeObject();
    $.ajax({
      url: '/characters',
      type: 'post',
      dataType: 'json',
      data: {character: data}
    }).then(function(character) {
      var li = $('<li data-character-id="' + character.id + '" >' + character.name + '</li>');
      li.append($('<input type="checkbox">'));
      $('ul').append(li);

      bindCheckBoxes(li.find('input'));
    })
  });
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
    //dead ? character.addClass('dead') : character.removeClass('dead');

  });
}
