#Waypoints & scrollTo

Git clone `git@github.com:JAdshead/waypoints-play.git`


### scrollTo.

I have included a jquery plugin called [scrollTo](http://flesler.blogspot.co.uk/2007/10/jqueryscrollto.html).

Uncomment the scrollTo section in our main.js file

```
  $nav_links.click( function(event) {
    $.scrollTo(
      $(this).attr("href"),
      {
        duration: 200,
        offset: { 'left':0, 'top':0 }
      }
    );
  });
```

$nav_links = all the links in our navigation element


```
(what you are scrolling, $ is = to scrolling window).scrollTo(
	(where to scroll to),
	{
		settings such as duration and offset
	}
);
```

# Waypoints

[Waypoints](http://imakewebthings.com/jquery-waypoints/)
 is a jQuery plugin by Caleb Troughton.

All it does is trigger events when the user scrolls to a certain element. 



## Links scrolling


- Now uncomment the menu update section


- We are going to add the JS for the third section. 


- We need to bind waypoint to an element.  
for example `what_we_want_to_bind.waypoint()`

- Waypoint takes some options.  
one of which is  `handler`
	- `handler` takes a function. 

We can pass this a function to run when the waypoint is triggerd  

```
  $section_three.waypoint({
    handler: function() {
      alert("Waypoint reached.");
    }
  })
```

Waypoint also gives us the direction the user is scrolling.

Lets update our code so that it will remove the `active` class from all our nav links, then add the call active to our third **nav** element 

```
 $section_three.waypoint({
   handler: function(direction){
     if (direction == "down") {
       removeActive();
       $nav_three.addClass('active')
     }
   }
 })
```

This now updates the links on the way down only
we now need to do this on the way up

```
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
```

## Create Submarine
We are now going to make a submarine in css

Duel window in sublime

`alt + cmb + 2`  

in one window `index.html`  
in the other `style.css`


In the second section of index.html

- add  
`<div id="sub" class="center-div"> </div>`


- In style.css under the ??? (rename to Sub) section

```
#sub {
  background: white;
  width: 250px;
  height: 250px;
}
```

Now we can see the div we are working in.

Lets add our parts for the submarine.

**index.html**

```
	<div id="sub" class="center-div">
	  <div id="viewport"></div>
	  <div id="hatch"></div>
	  <div id="propeller"></div>
	  <div id="body"></div>
	</div>
```

**CSS**

First create the body for the submarine.

```
#body {
  background: #f0d825;
  width: 225px;
  height: 65px;
  border-radius: 100 70 70 100;
  float: left;
  position: relative;
}
```

We now are going to add our propeller, hatch and viewport.   

```
#propeller {
  background: #f0d825;
  width: 20px;
  height: 60px;
  float: left;
  position: relative;
  top: 2.5px;
  right: -5px;
  border-top-right-radius: 100;
  border-bottom-right-radius: 100;
  border-bottom-left-radius: 30;
  border-top-left-radius: 30;
}
```


```
#hatch {
  background: #f0d825;
  width: 40px;
  height: 20px;
  position: relative;
  border-top-right-radius: 5;
  border-top-left-radius: 5;
  top: 10px;
  left: 180px;
}
```

```
#viewport{
  background: #f0d825;
  width: 10px;
  height: 15px;
  position: relative;
  top: 10px;
  left: 200px;
}
```

Now we could add some portholes




**HTML**

Inside our body div

```
	<div id="body">
	  <div id="right" class="porthole"></div>
	  <div id="middle" class="porthole"></div>
	  <div id="middle-2" class="porthole"></div>
	  <div id="left" class="porthole"></div>
	</div> 
```     
**CSS**

First lets update the porthole class

```
.porthole {
  border: 1px solid #999797;
  background: radial-gradient(#f1eeee, #ffef4c);
  width: 23px;
  height: 23px;
  border-radius: 400;
  position: absolute;
  top: 10;
}
```

Now we need to position our portholes

```
#left {
  left: 50;
}
```

```
#middle {
  left: 90;
}
```

```
#middle-2 {
  left: 130;
}
```

```
#right {
  left: 170;
}
```

Get rid of our sub background colour

######Now we have a submarine


Uncomment **Deep sea** in css and HTML


## Sun sub parallax

First we are going to create a funciton to fix all our elements

####under waypoints extra

```
 function fixAll() {
    $the_sun.addClass("fix-it")
    $sub.addClass("fix-it")
    $sub_dark.addClass("fix-it")
  }
```

At the top of waypoints extras lets call this when the window loads.

`fixAll();`



Lets get the sun setting.

In **main.js**

```
  $section_one.waypoint({
    handler: function(direction){
      $the_sun.removeClass("fix-it")
      $the_sun.addClass("sticky")
    }
  })
```


Lets add a sunset. 

- `index.html`  uncomment the sun-set div 
-  in style.css under backgrounds uncomment sun-set


Now the sun is sinking into the sea..

lets use the waypoints to **remove** the sticky class and **add** the fix-it class

```
  $section_two.waypoint({
    handler: function(direction){
      $the_sun.addClass("fix-it")
      $the_sun.removeClass("sticky")
    }
  })

```

As we can see the sun is still showing a little bit at before the waypoint function is called.

add an offset to move the waypoint up a little

```
  $section_two.waypoint({
    handler: function(direction){
      $the_sun.addClass("fix-it")
      $the_sun.removeClass("sticky")
    },
    offset:150
  })
```

now we want the sun to turn into the sub.

```
  $section_two.waypoint({
    handler: function(direction){
      $the_sun.addClass("fix-it")
      $the_sun.removeClass("sticky")

      $sub.removeClass("fix-it")
      $sub.addClass("sticky")
    },
    offset:150
  })
```


###### BUT THIS ONLY WORKS ON THE WAY DOWN

The Long way

```
  $section_two.waypoint({
    handler: function(direction){

      if (direction=="down"){
        $the_sun.addClass("fix-it")
        $the_sun.removeClass("sticky")
        $sub.removeClass("fix-it")
        $sub.addClass("sticky")
      } else {
        $the_sun.removeClass("fix-it")
        $the_sun.addClass("sticky")
        $sub.addClass("fix-it")
        $sub.removeClass("sticky")
      }
    },
    offset:150
  })
```

This would be a pain if we want to do this more than once.

#### Refactor it

create a function called parallaxy.

```
  function parallaxy(direction, item_down, item_up){
    fixAll();
    if(direction == "down"){
      item_down.removeClass("fix-it").addClass("sticky")
    }
    if(direction == "up"){
      item_up.removeClass("fix-it").addClass("sticky")
    }
  };
```

we can call parallaxy passing the direction and two elements were changing classes for.

```
  $section_two.waypoint({
    handler: function(direction){
      parallaxy(direction, $sub, $the_sun);
    },
    offset:150
  })
```

We can now quickly add the deep sea sub

```
  $section_three.waypoint({
    handler: function(direction){
      parallaxy(direction, $sub_dark, $sub);
    },
    offset:250
  })
```


### Fix scrollTo location

When we click the link to 'sea' we dont see the submarine. 

Lets fix it by offsetting the scrollTo location.

in **main.js**

```
  $nav_links.click( function(event) {
    $.scrollTo(
      $(this).attr("href"),
      {
        duration: 2000,
        offset: { 'left':0, 'top':500 }
      }
    );
  });
```

# Resources


- <http://webdesign.tutsplus.com/articles/create-a-sticky-navigation-header-using-jquery-waypoints--webdesign-6408>  
- <http://imakewebthings.com/jquery-waypoints/>  
- <http://flesler.blogspot.co.uk/2007/10/jqueryscrollto.html>

