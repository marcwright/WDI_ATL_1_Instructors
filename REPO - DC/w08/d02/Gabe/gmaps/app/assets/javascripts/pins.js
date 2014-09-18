$(function(){
  // DISPLAY EXISTING PINS FROM DB:

  //first, ajax calls up and gets the pins from the   db:
  var pins = $.ajax({
    url: 'root',
    type: 'GET',
    dataType: 'json',
    data: {pin: latitude, longitude},
    context: this

  });

  function displayPin(){
    //This should iterate through the pins...
    for( i = 0; i < pins.length; i++){

      //get each pins long and lat
      var latitude = self.latitude;
      var longitude = self.longitude;

      //make a new location for each pin
      var location = new google.maps.LatLng(latitude  ,  longitude);

      //making a new marker for each pin...
      var newMarker = new google.maps.Marker({
        position: location,
        map: map
    })};
  };
});

//CREATE A NEW PIN
function createPin(latitude, longitude){
   google.maps.event.addListener(map, 'click', function(event) {
  //have to 'find' where the mouse has clicked?

  //turn that into lat and long?

  //Ajax post this new pin to the db
  $.ajax({
      url: 'pins_path',
      type: 'POST',
      dataType: 'json',
      data: {latitude, longitude},
      context: this
    });
};


// =======================================

//QUESTIONS:

// what does .ajax do?
// --performs a http request, (get post etc) essentially 'calls' which can be used to trigger different controller methods.

// what does url mean in this context?
// --A string containing the URL to which the request is sent?

// does URL mean restful route?
// --unknown

// how do i add this sent data to my database?

// how can my controller add it to my database?

//=========================================

// QUESTIONS II


// what is the process by which a created/preexisting pin is shown?
// --i visit the root page.
// --in the process, self-executing JS runs??
// --the js is calling up the pins controller, asking for pins????
// --it gets the pins?
// --it shows me a map with pins rendered in it?






// what is the process by which a pin is created?

// --click on map
// --listener in the pin.js file hears me;
// --it captures my click coordinates
// --it sends them, with ajax, as lat and long, to the pins controller, as an http call
// --pins controller takes this call, and extracts the lat and long from params, saving them to the db.
