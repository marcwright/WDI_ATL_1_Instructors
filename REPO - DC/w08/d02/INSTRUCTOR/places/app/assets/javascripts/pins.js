$(function(){

    // Setup the Google Map
    var mapOptions = {
      center: new google.maps.LatLng(-34.397, 150.644),
      zoom: 8
    };
    var map = new google.maps.Map(document.getElementById("map-canvas"),
      mapOptions);

    function placeMarker(pin) {
      var image = 'http://cl.ly/image/1r1b2C053j2P/kangaroo-48.png';
      var marker = new google.maps.Marker({
        position: new google.maps.LatLng(pin.lat, pin.long),
        map: map,
        animation: google.maps.Animation.BOUNCE,
        icon: image
      });
    }

    // Load pins
    $.getJSON("/pins").then(function(pins){
      $.each(pins, function(index, pin){
        placeMarker(pin);
      });
    });

    // Create a pin
    google.maps.event.addListener(map, 'click', function(event) {
      $.ajax({
        url: "/pins",
        type: "POST",
        dataType: 'json',
        data: {pin: {lat: event.latLng.k, long: event.latLng.A}}
      }).then(function(pin){
        placeMarker(pin);
      });
    });

});