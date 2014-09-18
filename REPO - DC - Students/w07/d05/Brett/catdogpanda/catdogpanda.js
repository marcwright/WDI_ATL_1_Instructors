var $newCat = $("<img src='http://placekitten.com/200/300'>").addClass("cat");
$("body").append($newCat);

var $newDog = $("<img src ='http://placepuppy.it/images/homepage/Beagle_puppy_6_weeks.JPG'>").addClass("dog");
$("body").append($newDog);

var $newPanda = $("<img src ='http://www.thepetcollective.tv/wp-content/uploads/2013/05/china-panda-researchers-4.jpg'>").addClass("panda");
$("body").append($newPanda);

$("body").on("mousemove", function( event ) {
  var pageCoords = "( " + event.pageX + ", " + event.pageY + " )";
  $("h1").text( "x: " + event.pageX + ", " + "y: " + event.pageY );

  $(".cat").css({"margin-left": (event.pageX / 10), "margin-top": (event.pageY / 10)});

  $(".dog").css("margin-left", (event.pageX / 15));
  $(".dog").css("margin-top", (event.pageY / 15));

  $(".panda").css("margin-left", (event.pageX / 20));
  $(".panda").css("margin-top", (event.pageY / 20));
});

$("img").on("click", function() {
  event.stopPropagation();
  $(this).toggleClass("blue-border");
})


$("body").on("click", function(event) {
  $("body").off();
});
