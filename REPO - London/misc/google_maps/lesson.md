# Google Maps

## Objective
- Students understand what the Google Maps API is, and how it works
- Students can use Google Maps in their project
- Students understand how to configure Google Maps
- Students understand how to integrate advanced maps into their apps. 


## Lesson 
- So today we're going to look at Google Maps. 
- Google Maps is a service provided by Google. It can show people maps, but it can also do other things - like drawing on a map, or looking up address details. 
- And we can use it in our own application. 
  - This is a common pattern; in the same way we like to use gems instead of building stuff from scratch, we like to use web services to provide things we don't want to build ourselves.
  - If something is not a core competency of a business, you should deeply consider outsourcing it. 
  - If something is not the core part of our project, we should probably not build it ourselves unless we have to. 

## Let's jump in. 
- Let's build a simple HTML page for a local business.
  - Address element
  - 9 Back Hill, EC1R 5EN
  - Add a placeholder image. 
    - http://placehold.it/300x300
    - http://placekitten.com/300x300
  - Simple styling. 
- Let's add a maps embed. 
  - Go to http://code.google.com/apis/console/
  - Create a new project
  - Select 'services' 
  - Scroll down to 'Google Maps JavaScript API v3' and turn it on. 
  - Click 'API access' 
  - There's your API key. 
- Add the script tag
  - Set 'sensor' to false
    - It's about whether the user's position is coming from something like the geolocation data, which we're not doing.
  - Add your API key to the 'key' part. 
- Add a div for the map
  - And some CSS giving it a minimum height
  - Let's make sure it shows up. 
- Let's add our own script. 
  - application.js
  - initialize function (American spelling)
  - Event listener on window load to load maps once page is done. 
  - Note the namespacing.

- Let's customise this. 
  - Do we want people to have these controls? Let's get rid of the map/satellite and the street view guy. 
    - streetViewControl: false, mapTypeControl: false

- So we can see the local area...
- ... but not where GA is specifically. 
- Let's add a marker! 
  - Add marker
  - map.setCenter afterwards. 

- But... we had to find this position ourselves. 
- How could we do this differently? 
  - Geocoding. 
  - Geocoding is transforming one point of reference to another. 
    - Addresses to lat/long
    - lat/long to address. 
    - Same data, expressed differently. 

- Let's write something that looks for addresses on the page, and plots them on a map.
  - Add jQuery
  - Create a Geocoder
  - Add a callback
  - Check status. 
  - Add another address. 

## Your turn
- Let's let a user enter their current location, and display it on a map. 
- You'll need a textbox to let them enter a postcode...
- ... And you'll need to pass it to your geocoder. 
- ... And maybe it should show a different kind of marker. 
- ... And MAYBE it should zoom out to show them both markers simultaneously.





# If we have time. 
- Let's do something cool: geolocation
- HTML5 geolocation API
- Button to click to get it
- Draw a marker on the map
- Draw a shape to show you. 




