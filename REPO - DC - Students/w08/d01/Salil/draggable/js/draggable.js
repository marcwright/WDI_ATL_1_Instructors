$body = $('body');

$('.empty').each( function() {

  var $empty = $(this);

  $(this).css({
    top: Math.random() * ($body.height() - $empty.height()),
    left: Math.random() * ($body.width() - $empty.width())
  })
});

$('.drag').on('mousedown', function(evt) {
  evt.preventDefault();
  var $dragger = $(this);
  var $doc = $(document);

  $doc
    .on('mousemove', function(evt) {
      evt.preventDefault();
    $dragger.css({
      top: evt.pageY - ($dragger.height() / 2),
      left: evt.pageX - ($dragger.width() / 2)
    });
  })
  .on('mouseup', function() {
    $doc.off('mousemove mouseup');
    drop($dragger);
  });

});

function drop(el) {
  var $el = $(el);
  var className = $el.attr('class').replace('drag ', '');
  var $negative = $('.empty.'+className);
  var negativePosition = $negative.position();
  var positivePosition = $el.position();
  if(distance(negativePosition, positivePosition) < 50) {
    $el.animate(negativePosition);
  }
}

function distance(p1, p2) {
  var a = p2.left - p1.left;
  var b = p2.top - p1.top;
  return Math.sqrt( a * a + b * b);
}
