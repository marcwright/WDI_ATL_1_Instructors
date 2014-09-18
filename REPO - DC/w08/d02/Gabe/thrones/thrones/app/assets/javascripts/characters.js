$(function(){
  var $boxes = $('li input[type="checkbox"]');
  bindCheckBoxes($boxes);


  var $form = $('form');
  $form.on('submit', function(evt){
    evt.preventDefault();

    //console.log($(this).serialize());
    var data = $(this).serializeObject();
    console.log(data);

    $.ajax({
      url: '/characters',
      type: 'POST',
      dataType: 'JSON',
      data: {character: data}

    })then.function(character){
      console.log(character);
      var li = $('<li data-character-id="' + character.id + '" >' + character.name + '</li>');
      li.append($('<input type="checkbox">'));

      $('ul').append(li);

  });
});

function bindCheckBoxes($boxes){

  $boxes.on('change', function(){
      alert('Character existential data updated!');
      //finds out their id #
      var character = $(this).parent();
      //finds if they're dead (t or f)
      var is_dead = $(this).prop('checked');

      $.ajax({
        url: '/characters/' + character.data('character-id'),
        type: 'POST',
        dataType: 'JSON',
        data: { _method: 'PATCH', character: {dead: is_dead}}
      });

  });

}
