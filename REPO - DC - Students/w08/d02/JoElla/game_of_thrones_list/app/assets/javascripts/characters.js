// Run code after the DOM has loaded
$(function(){
  var $boxes = $('li input[type="checkbox"]');
  bindCheckBoxes($boxes);

  var $form = $('form')
  $form.on('submit', function(evt){
    evt.preventDefault();

    var data = $(this).serializeObject();
    console.log(data);

    $.ajax({
      url: '/characters',
      type: 'POST',
      dataType: 'json',
      data: {character: data}
    }).then(function(response){
      console.log(response);
      var li = $('<li data-character-id="' + character.id + '">' + character.name + '</li>')
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
    // dead ? character.addClass('dead') : character.removeClass('dead');

  });
}
