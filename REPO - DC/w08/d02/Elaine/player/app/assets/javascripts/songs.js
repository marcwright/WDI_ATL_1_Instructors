$(function() {
  var keyword = '';



});

function bindForm(){
  var $form = $('form');
  $form.on("submit", search);
}

function search(evt) {
  evt.preventDefault();

  keyword = $('#search').val();
  var apiPath = 'https://itunes.apple.com/search?term=' + escape(keyword) + '&media=music&entity=musicTrack&limit=1';

  $.getJSON(apiPath).then(function(data) {

  }
}
