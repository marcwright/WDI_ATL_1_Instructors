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

  $nav_links.click( function(event) {
    $.scrollTo(
      $(this).attr("href"),
      {
        duration: 1000,
        offset: { 'left':0, 'top':0 }
      }
    );
  });


//////----- menu update 


  $section_one.waypoint({
    handler: function(direction){
      if (direction == "down") {
        removeActive();
        $nav_one.addClass('active')
      }
    },
    offset: -50
  })

  $section_one.waypoint({
    handler: function(direction){
      if (direction == "up") {
        removeActive();
        $nav_one.addClass('active')
      }
    },
    offset: function() {
      return -$(this).height();
    }
  })

  $section_two.waypoint({
    handler: function(direction){
      if (direction == "down") {
        removeActive();
        $nav_two.addClass('active')
      }
    },
  });



  // /// // / / // // /

  $section_two.waypoint({
    handler: function(direction){
      if (direction == "up") {
        removeActive();
        $nav_two.addClass('active')
      }
    },
    offset: function() {
      return -$(this).height();
    }
  });

  $section_three.waypoint({
    handler: function(direction){
     if (direction == "down") {
       removeActive();
       $nav_three.addClass('active')
     }
    }
  })
  // /// // / / // // /


  function removeActive() {
    $nav_links.removeClass('active');
  };



  //////----- Waypoints Extras

  fixAll();

  $section_one.waypoint({
    handler: function(direction){
      $the_sun.removeClass("fix-it")
      $the_sun.addClass("sticky")
    }
  })


  $section_two.waypoint({
    handler: function(direction){
      parallaxy(direction, $sub, $the_sun);
    },
    offset:150
  })


  $section_three.waypoint({
    handler: function(direction){
      parallaxy(direction, $sub_dark, $sub);
    },
    offset:250
  })

  function parallaxy(direction, item_down, item_up){
    fixAll();
    if(direction == "down"){
      item_down.removeClass("fix-it")
      item_down.addClass("sticky")
    }
    if(direction == "up"){
      item_up.removeClass("fix-it")
      item_up.addClass("sticky")
    }
  };


  function fixAll() {
    $the_sun.addClass("fix-it")
    $sub.addClass("fix-it")
    $sub_dark.addClass("fix-it")
  }


});
