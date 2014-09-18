$.getJSON('/posts').then(function(posts){
  $.each(posts, function(index, post){
    var li = $('<li data-post-id="' + post.id + '">' + post.url + ' ' + post.votes + '</li>');
    li.append($('<span>&hearts;</span>'));
    li.append($('<span>&times;</span>'));
    $('ul').append(li);
  });
})