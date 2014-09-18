/*
* @Author: Richard Hessler
* @Date:   2014-06-09 09:12:02
* @Last Modified by:   Richard Hessler
* @Last Modified time: 2014-06-09 11:28:10
*/
$body = $('body');


$('.empty').each(function(){
  var $empty = $(this)

  $empty.css({
    top: Math.random() * ($body.height() - $empty.height() - 200) + 200,
    left: Math.random() * $body.width() - $empty.width(),
  });

});

$('.drag').on('mousedown', function(event) {

  event.preventDefault();
  var $dragger = $(this);
  var $doc = $(document);

  $doc
    .on('mousemove', function(event) {

      event.preventDefault();
      $dragger.css({
        top: event.pageY - ($dragger.height()/2),
        left: event.pageX - ($dragger.width()/2)
    });
  })
    .on('mouseup', function() {
      $doc.off('mousemove mouseup');
      drop($dragger);
    })

});

//el short for element
function drop(element) {
  var $el = $(element);
  var className = $el.attr('class').replace('drag ', '');
  var $negative = $('.empty.' +className);
  var negativePosition = $negative.position();
  var positivePosition = $el.position();

 if(distance(negativePosition, positivePosition) < 500) {
  $el.animate(negativePosition);
 }
}

function distance(p1,p2) {
  var a = p2.left - p1.left;
  var b = p2.top - p2.top;
  return Math.sqrt(a*a + b*b);
}
