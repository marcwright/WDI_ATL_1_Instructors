$(function(){
  var $boxes = $('li input[type="checkbox"]');
  bindCheckBoxes($boxes);
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
