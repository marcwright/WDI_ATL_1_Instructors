var $body = $('body');

$body.prepend('<img class="cat" src="http://assets.dogtime.com/breed/profile/image/4edfe795bc8662070600042a/max_400_Russian-Blue-cat-breed-profile.jpg" />');
$body.prepend('<img class="dog" src="http://static.ddmcdn.com/gif/dog-breed-dog-breed-pictures1.jpg" />');
$body.prepend('<img class="panda" src="http://upload.wikimedia.org/wikipedia/commons/2/25/Lesser_panda_standing.jpg" />');

$body.on('mousemove', function(event){
  var msg = '(' + event.pageX + ', ' + event.pageY + ')';
  $('h1').text(msg);
  $('.cat').css({'margin-left': event.pageX/4, 'margin-top': event.pageY/4})
  $('.dog').css({'margin-left': event.pageX/10, 'margin-top': event.pageY/4})
  $('.panda').css({'margin-left': event.pageX/20, 'margin-top': event.pageY/4})
});

$('img').on('click', function(event){
  console.log('hiiiii');
  event.stopPropagation();
  $(this).toggleClass('blue-border');
});

$body.on('click', function(){
  $('body').off('mousemove');
});
