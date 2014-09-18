/*
* @Author: stephenstanwood
* @Date:   2014-06-11 06:59:34
* @Last Modified by:   stephenstanwood
* @Last Modified time: 2014-06-12 11:25:17
*/

var map;

$( function() {
  google.maps.event.addDomListener( window, 'load', initializeMap );

  $.ajax({
    url: '/get_all',
    type: 'get',
    dataType: 'json',
    context: this
  }).then( displaySavedPins );
});

function initializeMap() {
  var mapOptions = {
    center: new google.maps.LatLng( 38.900540, -77.018355 ),
    zoom: 11
  };
// debugger
  map = new google.maps.Map( document.getElementById( 'map-canvas' ), mapOptions);

  google.maps.event.addListener( map, 'click', function( e ) {
    // get the lat/long of where the user clicked
    var ll = e.latLng;

    $.ajax({
      url: '/pins',
      type: 'post',
      dataType: 'json',
      data: { pin: { lat: ll.k, long: ll.A } },
      context: this
    }).then( displayPin );
  });
}

function displayPin( pin ) {
  var location = new google.maps.LatLng( pin.lat, pin.long );
  var newMarker = new google.maps.Marker({
    position: location,
    map: map
  });
}

function displaySavedPins( pins ) {
  for ( var i = 0, num = pins.length; i < num; i++ ) {
    var location = new google.maps.LatLng( pins[i].lat, pins[i].long );
    var newMarker = new google.maps.Marker({
      position: location,
      map: map
    });
  }
}
