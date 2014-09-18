
$(window).on('scroll', function(){

var distance = $(window).scrollTop();
var dooga = Array(distance).join("dooga!")
// console.log(distance);
console.log(dooga);

var dooga = Array(distance).join("dooga!")
$('.bg').css('top', -distance*0.3);
$('img').css('width', (distance /(Math.sqrt(distance))) + 10 + '%');
});
