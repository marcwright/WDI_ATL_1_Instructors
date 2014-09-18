/*
* @Author: Richard Hessler
* @Date:   2014-06-09 13:34:30
* @Last Modified by:   Richard Hessler
* @Last Modified time: 2014-06-09 14:31:47
*/
var keyword ='';
var offset =0;

function search(keyword){
  var apiPath = 'http://api.giphy.com/v1/gifs/search?api_key=dc6zaTOxFJmzC&q=';
  apiPath += escape(keyword);
  apiPath += '&offset=' +offset;

  $.getJSON(apiPath).then(function(gif){


    var html = '';

    for (var i=0; i<gif.data.length; i++){
      offset += 1;
      html += '<img src="' + gif.data[i].images.original.url +'" alt="" data-index="'+offset+'">';
    }
    $('body').append(html);
  });
}

$('#search').on('submit', function(event){
  event.preventDefault();

  var keyword = $('#keyword').val();
  offset = 0;
  search(keyword);
});


///////////////////////////////
//
// Infinite Scroll Command
//
///////////////////////////////
$(window).on('scroll', _.debounce(function() {
  if ($(window).scrollTop() + $(window).height() >=(document).height()) {
    search();
  }
}, 100));

$('body').on('click', 'img', function() {
  $(this).toggleClass('big');
});
