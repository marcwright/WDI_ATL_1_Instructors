
var offset = 0;
var keyword = '';

function search(keyword) {
  var apiPath = 'http://api.giphy.com/v1/gifs/search?api_key=dc6zaTOxFJmzC&q=';
  apiPath += escape(keyword);
  apiPath += '&offset' + offset;

  $.getJSON(apiPath).then(function(gifs) {

    var html = '';

    for (var i=0; i < gifs.data.length; i++) {
      offset =+ 1;
      html += '<img src="'+ gifs.data[i].images.original.url +'" alt="" data-index="'+i+'">';
    }

    $("body").append(html);
    console.log(html);
  });
}


$('#search').on('submit', function(evt) {
  evt.preventDefault();

  keyword = $('#keyword').val();
  search(keyword);
});

$(window).on('scroll', _.debounce(function(){
  if ($(window).scrollTop() + $(window).height() >= $(document).height()) {
    search();
  }
}, 200));

$('body').on('click', 'img', function(){
  $(this).toggleClass('big');
});
