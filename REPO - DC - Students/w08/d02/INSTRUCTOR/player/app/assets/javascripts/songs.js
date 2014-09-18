$(function(){
  bindForm();
  bindDeleteButtons($("li span"));
});

function bindForm() {
  $("form").on("submit", function(evt) {
    evt.preventDefault();
    var data = $(this).serializeObject();
    console.log(data);

    $.ajax({
      url: "/songs",
      type: "POST",
      dataType: 'json',
      data: {song: data},
      context: this
    }).then(appendSong);
  });
}

function appendSong(song) {
<<<<<<< HEAD
  debugger
=======
  //what is being reset?
>>>>>>> 548fe458a01b8f1a02bd634767dc78cf088a798c
  this.reset();

  var li = $("<li data-song-id=" + song.id + " >" + song.title + "</li>");
  // li.data('song-id', song.id);
  li.append($("<audio controls><source src='" + song.preview_url + "'></audio>"));
  li.append($("<span>&times;</span>"));
  $("ul").append(li);
  bindDeleteButtons(li.find("span"));
} 


function bindDeleteButtons(buttons) {
  buttons.on("click", function() {
    var song = $(this).parent();
    deleteSong(song);
  });
}

function deleteSong(song) {
  $.ajax({
    url: "/songs/" + song.data("song-id"),
    type: "POST",
    dataType: "json",
    data: {_method: "delete"},
    context: song // passes the context so we can call 'this' on success
  }).then(removeSong);
}
//why do we separate the above and below functions?
function removeSong(){
  this.remove(); //'this' refers to the song
}
