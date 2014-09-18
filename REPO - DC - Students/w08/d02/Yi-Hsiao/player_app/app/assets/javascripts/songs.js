$(function() {
  var $form = $( "#form-add-song" );
  var $playlist = $( "#tbody-playlist" );
  var songIDDataAttr = "song-id";

  function initialize() {
    handleAddSongFormSubmit();
    handleDeleteButtonClick();
  }

  // adds song to DB on form submission
  function handleAddSongFormSubmit() {
    $form.on( "submit", function( evt ) {
      evt.preventDefault();

      var data = $( this ).serializeObject();
      addSongToDB( data )
        .then( addSongToView ) // update view
        .then( resetForm );    // reset form
    });
  }

  function handleDeleteButtonClick() {
    $playlist.on( "click", ".btn-delete-song", function( evt ) {
      evt.preventDefault();

      var $song = $( this ).closest( "tr" );
      var songID = $song.data( songIDDataAttr );

      deleteSongFromDB( songID )
        .then( function() {
          deleteSongFromView( $song );
        });
    });
  }

  // adds song to DB and returns promise
  function addSongToDB( data ) {
    return $.ajax({
      data: data,
      dataType: "json",
      type: "post",
      url: "/songs"
    });
  }

  // deletes song from DB and returns promise
  function deleteSongFromDB( id ) {
    return $.ajax({
      type: "delete",
      url: "/songs/" + id
    });
  }

  // adds a song to the playlist view
  function addSongToView( song ) {
    var html = '<tr data-' + songIDDataAttr + '="' + song.id + '">';
        html += "<td>" + song.title + "</td>";
        html += "<td>" + song.artist + "</td>";
        html += "<td>" + spotifyIframe( song.preview_url ) + "</td>";
        html += "<td>" + btnToDeleteSong( song.id ) + "</td>";
        html += "</tr>";
    $playlist.append( html );
  }

  function deleteSongFromView( song ) {
    $( song ).remove();
  }

  // returns html for a spotify play widget for a specified song URL
  function spotifyIframe( spotifyUrl ) {
    var html = '<iframe src="' + 'https://embed.spotify.com/?uri=' + spotifyUrl + '" ';
        html += 'with="300" height="80" frameborder="0" allowtransparency="true">';
        html += "</iframe>";

    return html;
  }

  // returns html for a delete button
  function btnToDeleteSong( id ) {
    var html = '<form action="/songs/' + id + '" class="button_to" method="post">';
        html += '<div>';
        html += '<input name="_method" type="hidden" value="delete">';
        html += '<input class="btn-delete-song" type="submit" value="Delete">';
        html += '</div>';
        html += '</form>';

    return html;
  }

  // resets the form
  function resetForm() {
    $form[0].reset();
  }

  initialize();
});