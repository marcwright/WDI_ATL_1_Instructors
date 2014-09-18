var $body = $('body');

var $cat = $('<img>');
$cat.attr('src', 'http://i.dailymail.co.uk/i/pix/2013/09/02/article-2408865-1B940355000005DC-321_634x632.jpg');
$cat.attr('class', 'cat');
$body.append($cat);

var $dog = $('<img>');
$dog.attr('src', 'http://www.toughpigs.com/wp-content/uploads/2013/04/A-dog-wearing-a-tuxedo.jpg?9d7bd4');
$dog.attr('class', 'dog');
$body.append($dog);

var $panda = $('<img>');
$panda.attr('src', 'http://1funny.com/wp-content/uploads/2012/07/cute-panda-cub.jpg');
$panda.attr('class', 'panda');
$body.append($panda);

var $h1 = $('h1');

$body.mousemove(function(event){
    $h1.text(event.pageX + ', ' + event.pageY);
    $('.cat').css({'margin-left': event.pageX/4, 'margin-top': event.pageY/4});
    $('.dog').css({'margin-left': event.pageX/2, 'margin-top': event.pageY/2});
    $('.panda').css({'margin-left': event.pageX, 'margin-top': event.pageY});

  });

$('img').on('click', function(){
  event.stopPropagation();
  $(this).toggleClass('blue-border');
});

$body.on('click', function(){
  $body.off('mousemove');
});
