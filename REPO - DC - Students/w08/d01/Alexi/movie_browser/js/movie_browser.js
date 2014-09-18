// API Docs at: 
// http://www.omdbapi.com
//  http://www.omdbapi.com/?s=True%Grit
var keyword = '';

function search(keyword) {
  //var searchType = $("#search-type").val();
  apiPath = 'http://www.omdbapi.com/?s=' + escape(keyword);
  
  $.getJSON(apiPath).then(function(results) {
    var titles = '';
    console.log(results);
    for (var i=0; i < results.Search.length; i++) {
      titles += '<option>' + results.Search[i].Title + '</option>';
    } 
    $("#movie-select").append(titles);
    // $("#option-value").html("Hello");
    //$("select option").replaceWith("Hello")
    
        
        //--> couldn't get the menu to change
  });
}

function display(keyword) {
  //var searchType = $("#search-type").val();
  apiPath = 'http://www.omdbapi.com/?t=' + escape(keyword);
  
  $.getJSON(apiPath).then(function(results) {
    console.log(results);
    var poster = '<img src=' + results.Poster + '">'
    var title = results.Title;
    $("#movie-detail").html(title).css({ "font-size": "50px", "float": "top" });
    // --> Couldn't figure out how to style the title and poster
    $("#movie-detail").append(poster).css({ "float": "bottom" });


  });
}

$('#search').on('submit', function(evt) {
  evt.preventDefault();
  keyword = $('#movie-search').val();
  search(keyword);
});

$('#movie-select').on('change', function(evt) {
  evt.preventDefault();
  keyword = $('#movie-select').val();
  display(keyword); 
})

