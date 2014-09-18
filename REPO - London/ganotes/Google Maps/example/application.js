function initialize() {
    var mapOptions = {
        center: new google.maps.LatLng(51.5, -0.1),
        zoom: 14
    };
    var map = new google.maps.Map(document.getElementById("map_canvas"),
        mapOptions);
    addMarker2(map);
}

function addMarker(map) {
    var position = new google.maps.LatLng(51.522, -0.1095);
    var marker = new google.maps.Marker({
        position: position,
        map: map,
        title: "GA London"
    });
    map.setCenter(position);
}

function addMarker2(map) {
    var geocoder = new google.maps.Geocoder();
    $('address').each(function(i, el) {
        geocoder.geocode({ address: $(el).text() }, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                var marker = new google.maps.Marker({
                    position: results[0].geometry.location,
                    map: map,
                    title: $(el).text()
                });
            }
        });
    });
}


google.maps.event.addDomListener(window, 'load', initialize);
