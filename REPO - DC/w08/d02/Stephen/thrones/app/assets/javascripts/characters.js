/*
* @Author: stephenstanwood
* @Date:   2014-06-10 11:53:22
* @Last Modified by:   stephenstanwood
* @Last Modified time: 2014-06-10 17:23:55
*/

$( function() {
  bindCheckBoxes( $( 'li input[type="checkbox"]' ) );
  bindForm();
  var $deleteButtons = $( 'li span' );
  bindDeleteButtons( $deleteButtons );
});

function bindCheckBoxes( boxes ) {
  boxes.change( function() {
    var character = $( this ).parent();
    var id = character.data( 'character-id' );

    var dead = $( this ).prop( 'checked' );

    $.ajax({
      url: '/characters/' + id,
      type: 'patch',
      dataType: 'json',
      data: { character: { dead: dead } }
    });

    character.toggleClass( 'dead' );
  });
}

function bindForm() {
  var $form = $( 'form' );
  $form.submit( function( e ) {
    e.preventDefault();

    var $s = $( this ).serialize();
    var name = $s.substring( $s.indexOf( '=' ) + 1 );

    $.ajax({
      url: '/characters',
      type: 'post',
      dataType: 'json',
      data: { character: { name: name } },
      context: this
    }).then( appendCharacter );
  });
}

function appendCharacter( ch ) {
  // this.reset();
  var li = $( '<li data-character-id="' + ch.id + '">' );
  li.append( ch.name + '</li>' );
  li.append( $( '<input type="checkbox">' ) );
  li.append( $( '<span>bye bye</span>' ) );
  $( 'ul' ).append( li );
  bindCheckBoxes( li.find( 'input' ) );
}

function bindDeleteButtons( buttons ) {
  buttons.click( function() {
    var character = $( this ).parent();

    $.ajax({
      url: '/characters/' + character.data( 'character-id' ),
      type: 'delete',
      dataType: 'json',
      context: character
    }).then( function() {
      $( this ).remove();
    });
  });
}
