// API Docs at:
// http://www.omdbapi.com

var keyword = '';

//movie results hidden by default;
//$('#movie-select').hide.preventDefault('#movie-select');    //BROKEN

function search(keyword) {

    var apiPath = 'http://www.omdbapi.com/?s=';
    apiPath += escape(keyword);

    var data = $.getJSON(apiPath);
    console.log(data);
    var html = '';

    //for each result, print out the title to var html.

    //THIS IS BREAKING, and although it works in console, throws a 'Cannot read property 'search' of undefined'-- perhaps im accessing the JSON data incorrectly? wont give me a length;
    for (var i=0; i < data.search.length; i++ ) {
      html += '<p>'+ data.search[i].title + '</p>';
    }

    //Adds the found results from var html to the drop-down menu...
    $("#movie-select").html(html);
};




$('#search').on('submit', function(evt) {
  evt.preventDefault();

  keyword = $('#movie-search').val();

  search(keyword);
});



$('body').on('click', 'img', function() {
  $(this).toggleClass('big');
});
