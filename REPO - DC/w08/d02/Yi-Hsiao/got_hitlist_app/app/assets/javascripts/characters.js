$(function() {

  var authenticityToken = $( "meta[name='csrf-token']" ).attr( "content" );
  var charIDAttr = "char-id";
  var $list = $( "#hit-list" );
  var $form = $( "#add-char" );

  function initialize() {
    // update character's status when checkboxes are clicked
    $list.on( "change", "input[type='checkbox']", function() {
      var $character = $( this ).parent();
      var charID = $character.data( charIDAttr );
      var charDead = $(this).prop( "checked" );

      updateCharacterInDB( charID, { dead: charDead } );

      // toggle .dead class for character, based on their status
      $character.toggleClass( "dead", charDead );
    });

    // add character to page when form is submitted
    $form.on( "submit", function( evt ) {
      evt.preventDefault();
      data = $( this ).serializeObject();
      addCharacterToDB( data )
        .then( appendCharacterToView )
        .then( clearForm );
    });

    $list.on( "click", ".delete-char", function() {
      $character = $( this ).parent();
      var id = $character.data( charIDAttr );
      deleteCharacterFromDB( id )
        .then(function() {
          removeCharacterFromView.call( $character[0] );
        });
    });
  }

  // update characters in DB
  function updateCharacterInDB( id, charAttributes ) {
    return $.ajax({
      data: { character: charAttributes },
      dataType: "json",
      type: "patch",
      url: "/characters/" + id
    });
  }

  // add characters in DB
  function addCharacterToDB( data ) {
    return $.ajax({
      data: data,
      dataType: "json",
      type: "post",
      url: "/characters/"
    });
  }

  // delete character from DB
  function deleteCharacterFromDB( id ) {
    return $.ajax({
      dataType: "json",
      type: "delete",
      url: "/characters/" + id
    });
  }

  // add character to hit list
  function appendCharacterToView( character ) {
    var html = '<li data-' + charIDAttr + '="' + character.id + '">';
    html += '<input type="checkbox">\n';
    html += character.name;
    html += "</li>";

    $list.append( html );
  }

  // remove character from list
  function removeCharacterFromView() { this.remove(); }

  // clears form
  function clearForm() { $form[0].reset(); }

  initialize();
});