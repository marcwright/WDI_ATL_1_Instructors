$(function() { 
  
  var $nav = $("nav");
  var $nav_links = $("nav a")

  var $nav_one = $("#nav_one")
  var $nav_two = $("#nav_two")
  var $nav_three = $("#nav_three")

  var $section_one = $("#one")
  var $section_two = $("#two")
  var $section_three = $("#three")

  var $the_sun = $("#sun")
  var $sub = $("#sub")
  var $sub_dark = $("#sub-dark")

//////----- scrollTo

  // $nav_links.click( function(event) {
  //   $.scrollTo(
  //     $(this).attr("href"),
  //     {
  //       duration: 1000,
  //       offset: { 'left':0, 'top':0 }
  //     }
  //   );
  // });


//////----- update menu links


  // $section_one.waypoint({
  //   handler: function(direction){
  //     if (direction == "down") {
  //       removeActive();
  //       $nav_one.addClass('active')
  //     }
  //   },
  //   offset: -50
  // })

  // $section_one.waypoint({
  //   handler: function(direction){
  //     if (direction == "up") {
  //       removeActive();
  //       $nav_one.addClass('active')
  //     }
  //   },
  //   offset: function() {
  //     return -$(this).height();
  //   }
  // })

  // $section_two.waypoint({
  //   handler: function(direction){
  //     if (direction == "down") {
  //       removeActive();
  //       $nav_two.addClass('active')
  //     }
  //   },
  // });



  //////////////////////////////////


  //////////////////////////////////


  function removeActive() {
    $nav_links.removeClass('active');
  };



  //////----- Waypoints Extras

});
