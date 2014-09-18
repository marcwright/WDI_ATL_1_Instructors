var offset = 0;
var keyword = '';

function search(keyword) {
  var apiPath = "http://api.giphy.com/v1/gifs/search?api_key=dc6zaTOxFJmzC&q=";
  apiPath += escape(keyword);
  apiPath += '&offset=' + offset;
  $.getJSON(apiPath).then(function(gifs) {
    var imgUrl = gifs.data[0].images.original.url;
    var html = '';
    for(var i=0; i < gifs.data.length; i++) {
      offset++;
      html += '<img src="' + gifs.data[i].images.original.url + '" alt="" data-index="' + offset + '">';
    }
    $('body').append(html);
  });
}

$('#search').on('submit',function(evt) {
  evt.preventDefault();
  keyword = $('#keyword').val();
  offset = 0;
  search(keyword);
});

// infinite scroll magic
$(window).on('scroll',_.debounce(function() {
  if ($(window).scrollTop() + $(window).height() >= $(document).height()) {
    search(keyword);
  }
}, 100));

$('body').on('click','img', function() {
  $(this).toggleClass('big');
});
