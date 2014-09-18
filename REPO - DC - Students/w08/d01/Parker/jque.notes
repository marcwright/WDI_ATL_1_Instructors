function search(keyword) {
  var apiPath = 'http://api.giphy.com/v1/gifs/search?api_key=dc6zaTOxFJmzC&q=';
  apiPath += escape(keyword);

  $.getJSON(apiPath).then(function(gifs) {

    var html = '';

    for (var i=0; i < gifs.data.length; i++) {
      html += '<img src="'+ gifs.data[i].images.original.url +'" alt="" data-index="'+i+'">';
    }

    //$("body").append(html);
    console.log(html);
  });
}


$('#search').on('submit', function(evt) {
  evt.preventDefault();

  var keyword = $('#keyword').val();
  search(keyword);
});


// $.getJSON('http://api.giphy.com/v1/gifs/search?api_key=dc6zaTOxFJmzC&q=')

function search(keyword) {
  var apiPath = 'http://api.giphy.com/v1/gifs/search?api_key=dc6zaTOxFJmzC&q=';
  apiPath += escape(keyword);
}

$.getJSON(apiPath).then(function(gifs) {


  var imgUrl = gif.data[0].images.original.url;
  var html = '';

  for (var i=0; i < gifs.data.length i++) {
    html += '<img src="' + gifs.data[i].images.original.url +'" alt="" data-index="'+i+
  }

  console.log(imgUrl);
});


$('#search').on('submit', function(evt) {
  evt.preventDefault();

  var keyword = $('#keyword').val();
  search(keyword);
});

