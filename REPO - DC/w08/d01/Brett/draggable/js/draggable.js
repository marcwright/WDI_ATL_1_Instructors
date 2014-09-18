$body = $("body");

$(".empty").each(function() {

  var $empty = $(this);

  $(this).css({
    top: Math.random() * ($body.height() - $empty.height() - 200) + 200,
    left: Math.random() * ($body.width() - $empty.width())
  });
});

$(".drag").on("mousedown", function() {

  event.preventDefault();
  var $dragger = $(this);
  var $doc = $(document);

  $doc
  .on("mousemove", function(event) {
    event.preventDefault();
    $dragger.css({
      top: event.pageY - ($dragger.height() / 2),
      left: event.pageX - ($dragger.width() / 2)
    });
  })
  .on("mouseup", function() {
    $doc.off("mousemove mouseup");
    drop($dragger);
  });

});

function drop(element) {
  // wrapping for safety
  var $element = $(element);
  var className = $element.attr("class").replace("drag ", "");
  var $negative = $(".empty." + className);

  var negativePosition = $negative.position();
  var positivePosition = $element.position();

  if (distance(negativePosition, positivePosition) < 50) {
    element.animate(negativePosition);
  }
}

function distance(p1, p2) {
  var a = p2.left - p1.left;
  var b = p2.top - p1.top;
  return Math.sqrt(a * a + b * b);
}
