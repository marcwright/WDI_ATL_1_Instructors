/*
* @Author: stephenstanwood
* @Date:   2014-06-10 11:53:22
* @Last Modified by:   stephenstanwood
* @Last Modified time: 2014-06-10 17:31:08
*/

$( function() {
  // bindCheckBoxes( $( 'li input[type="checkbox"]' ) );
  bindForm();
  bindDeleteButtons( $( 'li span' ) );

// $.getJSON('https://itunes.apple.com/search?term=heretic&attribute=titleTerm');
});

function bindForm() {
  var $form = $( 'form' );
  $form.submit( function( e ) {
    e.preventDefault();

    var $s = $( this ).serialize();
    var title = $s.substring( $s.indexOf( '=' ) + 1 );

    var apiPath = 'https://itunes.apple.com/search?term=';
    apiPath += escape( $( '#title' ).val() ) + '&media=music';
    // apiPath += '&entity=musicTrack';
    $.ajax( {
      url: apiPath,
      type: 'get',
      dataType: 'jsonp',
      context: this
    }).then( addSong );
  });
}

function addSong( songs ) {
  var title = songs.results[0].trackName;
  var artist = songs.results[0].artistName;
  var preview_url = songs.results[0].previewUrl;

  $.ajax({
    url: '/songs',
    type: 'post',
    dataType: 'json',
    data: { song: { title: title, artist: artist, preview_url: preview_url } },
    context: this
  }).then( appendSong );
}

function appendSong( song ) {
  this.reset();
  var li = $( '<li data-song-id="' + song.id + '">' );
  li.append( song.title + ' by ' + song.artist );
  li.append( '<audio controls><source src="' + song.preview_url + '"></audio>' );
  li.append( '</li>' );
  li.append( $( '<span>bye bye</span>' ) );
  $( 'ul' ).append( li );
  bindDeleteButtons( $( 'li span' ) );
}

function bindDeleteButtons( buttons ) {
  buttons.click( function() {
    var song = $( this ).parent();

    $.ajax({
      url: '/songs/' + song.data( 'song-id' ),
      type: 'delete',
      dataType: 'json',
      context: song
    }).then( function() {
      $( this ).remove();
    });
  });
}
