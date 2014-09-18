var keyword;

function search(query) {
  var apiPath = 'https://itunes.apple.com/search?term=' + escape(query) + '&entity=musicTrack';
  $.getJSON(apiPath).then(function(response) {
    console.log(response.results);
  });
}

$('#search').on('submit', function(evt) {
  evt.preventDefault();
  keyword = $('#song-search').val();
  debugger;
  search(keyword);
});

//////////////////////////second attempt

// function bindForm() {
//   var $form = $('form')
//   $form.on('submit', function(evt) {
//     evt.preventDefault();
//     var data = $(this);
//     console.log(data);

//     $.ajax({
//       url: 'https://itunes.apple.com/search?term=' + escape(query) + '&entity=musicTrack',
//       type: 'get',
//       dataType: 'json',
//       context: this
//     })
//   });
// }
