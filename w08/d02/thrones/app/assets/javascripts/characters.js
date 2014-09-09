$(function(){
  bindCheckBoxes($("li input[type='checkbox']"));
  bindForm();
  bindDeleteButtons($("li span"));
});

function bindCheckBoxes(boxes) {
  boxes.on('change', function() {
    var character = $(this).parent();
    var dead = $(this).prop('checked');

    console.log($(this).parent().data('character-id'));
    console.log($(this).prop('checked'));

    $.ajax({
      url: "/characters/" + character.data('character-id'),
      type: "POST",
      dataType: 'json',
      data: {_method: "put", character: {dead: dead}}
    });

    dead ? character.addClass("dead") : character.removeClass("dead");

    // updateCharacter(character, dead);
  });
}

function bindForm() {
  $("form").on("submit", function(evt) {
    evt.preventDefault();
    console.log($(this).serialize());
    var data = $(this).serializeObject();

    $.ajax({
      url: "/characters",
      type: "POST",
      dataType: 'json',
      data: {character: data},
      context: this
    }).then(appendCharacter);
  });
}

function appendCharacter(character) {
  console.log(character);
  console.log(this);
  this.reset();

  var li = $("<li data-character-id=" + character.id + " >" + character.name + "</li>");
  li.data('character-id', character.id);
  li.append($("<input type='checkbox' />"));
  li.append($("<span>&times;</span>"));
  $("ul").append(li);

  bindCheckBoxes(li.find("input"));
  bindDeleteButtons(li.find("span"));
}

function bindDeleteButtons(buttons) {
  buttons.on("click", function() {
    var character = $(this).parent();
    deleteCharacter(character);
  });
}

function deleteCharacter(character) {
  $.ajax({
    url: "/characters/" + character.data("character-id"),
    type: "POST",
    dataType: "json",
    data: {_method: "delete"},
    context: character // passes the context so we can call 'this' on success
  }).then(removeCharacter);
}

function removeCharacter(){
  this.remove(); //'this' refers to the character
}