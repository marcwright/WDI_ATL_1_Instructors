// API Docs at:
// http://www.omdbapi.com

function searchMovieSelector(keyword){
  var url = 'http://www.omdbapi.com/?s=' + escape(keyword)

  $.getJSON(url).then(function(data){
    var html = '';

    for(var i=0; i < data.Search.length; i++){
      var movie = data.Search[i];
      html += '<option value ="' + i + '">' + movie.Title + '</option>';
    }

    $('#movie-select').html(html)
  });
}


var $movieSelect = $('#movie-select');

$movieSelect.hide();

$('#search').on('submit', function(evt){
  evt.preventDefault();
  var keyword = $('#movie-search').val();
  $movieSelect.show();
  searchMovieSelector(keyword);
});

$('#movie-select').on('change', function(evt){
  evt.preventDefault();
  var selectMovie = $('#movie-select option:selected').text();
  var detail = 'http://www.omdbapi.com/?t=' + escape(selectMovie);
  $.getJSON(detail).then(function(data){
    var html = '';
    html += '<h2>' + data.Title + '</h2>';
    html += '<img src=' + data.Poster + '/>';
    html += '<p>' + data.Plot + '</p>';
    $('#movie-detail').html(html);
  });

});
