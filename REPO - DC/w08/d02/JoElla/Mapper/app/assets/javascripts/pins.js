$(function(){

  var mapOptions = {
    center: new google.maps.LatLng(-34.397, 150.644),
    zoom: 8
  };
  var map = new google.maps.Map(document.getElementById("map-canvas"),
      mapOptions);

  //This code creates a pin.
  // var location = new google.maps.LatLng(-34.139, 150.699);

  // var newMarker = new google.maps.Marker({
  //   position: location,
  //   map: map
  // });

  google.maps.event.addListener(map, 'click', function(event) {
    var location = { latitude: event.latLng.A, longitude: event.latLng.k }

    $.ajax({
      url: '/pins',
      type: 'POST',
      dataType: 'json',
      data: {pin: location},
      context: this
    });

  });

});



 // marker = new google.maps.Marker({
    //   position: event.latLng,
    //   map: map
    // });
