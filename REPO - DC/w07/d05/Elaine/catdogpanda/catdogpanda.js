var $image = $('<img src="http://corenaturopathics.com.au/wp-content/uploads/2013/10/Fluffy-Kitten.jpg">');
$image.addClass("cat");
var $body = $("body");
$body.append($image);

var $image2 = $('<img src="http://www.aplacetolovedogs.com/wp-content/uploads/fluffy-puppy.jpg">');
$image2.addClass("dog");
$body.append($image2);

var $image3 = $('<img src="http://upload.wikimedia.org/wikipedia/commons/c/c3/Cub_Red_Panda_almost_falling_of.jpg">');
$image3.addClass("panda");
$body.append($image3);

$body.mousemove(coordinates);

var $h1 = $("h1");

var $images = $("img");

$images.on("click", function(event){
  event.stopPropagation();
  $(this).toggleClass('blue-border');
})

$body.on("click", function(){
  $body.off('mousemove');
});

function coordinates(e){
  var x = e.pageX;
  var y = e.pageY;
  $h1.text("(" + x + ", " + y + ")");

  $image.css({"margin-top": y/3, "margin-left": x/3});
  $image2.css("margin-top", y/6);
  $image2.css("margin-left", x/6);
  $image3.css("margin-top", y/5);
  $image3.css("margin-left", x/5);
};
