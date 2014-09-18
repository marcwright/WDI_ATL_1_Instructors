
//global variables
var keyword ='';

//search function
function search(){

  var movieTitle = $('#movie-search').val(); //gets text input from search
  var totalMovies = 'http://www.omdbapi.com/?s=' + escape(movieTitle);  //url for api request using 'movieTitle' as params
  var html = '<option value =placeholder>'+movieTitle+'</option>'; //sets default dropdown value

  $.getJSON(totalMovies).then(function(results){ //api request

    for (var i=0; i < results.Search.length; i++){ // loops through api data
      var movieId = results.Search[i].imdbID;  // sets movieId to result of imdbID in api
      $('#movie-select').removeProp('hidden'); // removes default 'hidden' attribute on dropdown
      html += '<option value ="'+movieId+'">'+results.Search[i].Title+'</option>'; // incrementing html variable with options for dropdown
    }
        $('#movie-select').html(html); // adding html variable as an addition to '#movie-select' tag
  });
}


$('#movie-select').change(function(){ // function to show image
  var movieId = $(this).val(); // movieId set to value of current option
  var specificMovie ='http://www.omdbapi.com/?i=' + movieId; //setting specificMovie variable to api requst with id
  var html=''; // setting up variable

  $.getJSON(specificMovie).then(function(results){ //api request
        var posterUrl = results.Poster; // sets posterUrl equal to api poster result
        html += '<img src ="'+posterUrl+'">' ; //set html to img tag

        $('#movie-detail').html(html); // adds html to #movie-detail tag
        }
    );
});

$('#search').on('submit', function(event){ //triggers when 'submit' is clicked
  event.preventDefault();
  search(); //triggers search function
});

