$(function() {
  var map;  // google map instance

  function initialize() {
    // draw map on map canvas
    var canvas = document.getElementById( "map-canvas" );
    map = renderMap( canvas );

    // get markers from the database and draw previously drawn markers
    getMarkersFromDB()
      .then( drawPreviousMarkers );

    // add markers and persist any markers when a user clicks the map
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
      var singleMarker = [evt.latLng];

      placeMarker( evt.latLng );
      saveMarkerToDB({ latitude: latitude, longitude: longitude });
    });
  }

  // place marker on the page
  function placeMarker( googleLatLng ) {
    new google.maps.Marker({
        position: googleLatLng,
        map: map
    });
  }

  // draw old markers on the page
  function drawPreviousMarkers( markers ) {
    for ( var i = 0; i < markers.length; i++ ) {
      var marker = markers[i];
      var location = new google.maps.LatLng(marker.latitude, marker.longitude);
      placeMarker( location );
    }
  }

  // save markers to database
  function saveMarkerToDB( markerAttributes ) {
    return $.ajax({
      data: { marker: markerAttributes },
      type: "post",
      url: "/markers"
    });
  }

  // get markers from database
  function getMarkersFromDB() {
    return $.ajax({
      dataType: "json",
      type: "get",
      url: "/markers"
    });
  }
  
  initialize();
});
