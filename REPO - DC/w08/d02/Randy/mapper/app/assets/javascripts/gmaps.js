$(function(){
//////////////  Creates a New Instance of a Google Map ///////////////////
  // Sets up the initial map options, sets zoom and initial location
  var mapOptions = {
    zoom: 4,
    center: new google.maps.LatLng(-25.363882,131.044922)
  };
  // Creates a new instance of a google map
  var map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
//////////////////////////////////////////////////////////////
  getAllPins().then(function(pins){
    for (var i = 0; i < pins.length; i++){
      var location = new google.maps.LatLng(pins[i].latitude, pins[i].longitude);
      placeMarker(location);
  }});
  //////////////////////////////////////////////////////////////

  google.maps.event.addListener(map, 'click', function(e) {
    var local = {latitude: e.latLng.k, longitude: e.latLng.A};

    $.ajax({
      url: '/pins',
      type: 'post',
      data: {location: local},
      context: this
    })
    placeMarker(e.latLng)
  });

//////////////////// Creates a new Marker and places it on the Map //////////debugger
function placeMarker(position) {
  //var image = new google.maps.MarkerImage('images/self-distract-button-48.png');
  var marker = new google.maps.Marker({
    position: position,
    map: map,
    animation: google.maps.Animation.BOUNCE,
    //icon: image
  });
}

function getAllPins(){
  return $.ajax({
      url: '/',
      type: 'get',
      dataType: 'json'
    })
}

}); // And page ready function
