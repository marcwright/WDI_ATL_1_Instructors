
var $cat = $('<img src="http://cdn.teckler.com/images/DieselFit/d604a730b7a1a6b6ec1a566a41fe91fe.jpg" />')
$cat.addClass("cat");
$("body").append($cat);

var $dog = $('<img src="http://lostdogrescue.org/wp-content/uploads/Gansta-killing-a-toy.jpg" />')
//$dog.addClass("dog").append("body");
$dog.addClass("dog");
$("body").append($dog);


//http://28.media.tumblr.com/tumblr_l6anippr7A1qzgimro1_500.jpg
var $panda = $('<img src="http://28.media.tumblr.com/tumblr_l6anippr7A1qzgimro1_500.jpg" />')
$panda.addClass("panda");
$("body").append($panda);


$("body").mousemove(function( event ) {
  var pageCoords = "( " + event.pageX + ", " + event.pageY + " )";
  var clientCoords = "( " + event.clientX + ", " + event.clientY + " )";
  $( "h1" ).text( pageCoords );
});

$('body').mousemove(function(event) {
  $($cat).css({"margin-left" : event.pageX-175, "margin-top" : event.pageY-225 })
});

$('body').mousemove(function(event) {
  $($panda).css({"margin-left" : event.pageX/4, "margin-top" : event.pageY/4 })
});

$('img').on('click', function(){ 
  event.stopPropagation();
  $(this).toggleClass('blue-border');
});

('body').on('click', function() {
  $('body').off('mousemove');
});
