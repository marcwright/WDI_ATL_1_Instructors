$(function() {
  var map;  // google map instance

  function initialize() {
    // draw map on map canvas
    var canvas = document.getElementById( "map-canvas" );
    map = renderMap( canvas );

    getPinsFromDB()
      .then( drawPreviousPins );

    handleMapClicks();
  }

  function renderMap( el ) {
    var mapOptions = {
      // center on DC
      center: new google.maps.LatLng(38.904853, -77.034003),
      zoom: 12
    };

    var map = new google.maps.Map( el, mapOptions);

    return map;
  }

  function handleMapClicks() {
    google.maps.event.addListener( map, "click", function( evt ) {
      var latitude = evt.latLng.k;
      var longitude = evt.latLng.A;
      var singlePin = [evt.latLng];

      placePin( evt.latLng );
      savePinToDB({ latitude: latitude, longitude: longitude });
    });
  }

  function placePin( googleLatLng ) {
    new google.maps.Marker({
        position: googleLatLng,
        map: map
    });
  }

  function drawPreviousPins( pins ) {
    for ( var i = 0; i < pins.length; i++ ) {
      var pin = pins[i];
      var location = new google.maps.LatLng(pin.latitude, pin.longitude);
      placePin( location );
    }
  }

  function savePinToDB( pinAttributes ) {
    return $.ajax({
      data: { pin: pinAttributes },
      type: "post",
      url: "/pins"
    });
  }

  function getPinsFromDB() {
    return $.ajax({
      dataType: "json",
      type: "get",
      url: "/pins"
    });
  }

  initialize();
});
