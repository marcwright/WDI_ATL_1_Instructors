$(function(){
  var $form = $('form')
  $form.on('submit', function(evt){
    evt.preventDefault();
    var songName = ($( this ).serialize());
    console.log(songName);
    search(songName);
  });

  var apiPath = 'https://itunes.apple.com/search?term=jack+johnson'



});






