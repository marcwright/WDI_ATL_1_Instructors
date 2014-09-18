$(function() {
  var mapOptions = {
    center: new google.maps.LatLng(-34.397, 150.644),
    zoom: 8
  };

  // Creates a new instance of a google map
  var map = new google.maps.Map(document.getElementById("map-canvas"),
      mapOptions);

  getAllPins().then(function(pins){
    for (var i = 0; i < pins.length; i++) {
      var location = new google.maps.LatLng(pins[i].latitude, pins[i].longitude);
      placeMarker(location);
    }});

  google.maps.event.addListener(map, 'click', function(event) {
    var clickLatLong = event.latLng;

    $.ajax({
      url: "/pins",
      type: "POST",
      data: {pin: {latitude: clickLatLong.k, longitude: clickLatLong.A}},
      context: this
    })

    placeMarker(event.latLng);

  });

/////////////////////////////////

  function placeMarker(pin){
    var newMarker = new google.maps.Marker({
      position: pin,
      map: map,
      animation: google.maps.Animation.BOUNCE
    });
  }

  function getAllPins(){
    return $.ajax({
      url: '/',
      type: 'get',
      dataType: 'json'
    })
  }

});
