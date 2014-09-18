
var keyword ='';

function search(){
  var value = $('#search-type').val();
  var keyword = $('#search-keyword').val();
  var apiPath = 'http://ws.spotify.com/search/1/'+value+'.json?q=' +keyword;
  $.getJSON(apiPath).then(function(results){
    var html = '';
    for (var i=0; i<results[value+'s'].length; i++){
      html +=  '<li>'+results[value+'s'][i].name;
    $('#results').html(html);
    }
  });
}

$('#search').on('submit', function(event){
  event.preventDefault();
  search();
});

$('#search-type').change(search);

