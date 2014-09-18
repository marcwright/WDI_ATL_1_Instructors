# Maps

* need to access index.html via http (not file://)

* create an api key at https://code.google.com/apis/console/
* add the key to the script call
* then add the html that willchr handle the map container
```
 <div class="row">
    <div id="map-container" class="col-md-6">
      <div id="googleMap"></div>
    </div>
  </div>
```

* then initialize the map
```
  $(function(){
    var mapOptions,
            canvas,
            map;

        mapOptions = { 
          zoom:8,
          center:new google.maps.LatLng(51.508742, -0.120850),
          mapTypeId:google.maps.MapTypeId.ROADMAP
        };
        canvas = document.getElementById("googleMap");
        map = new google.maps.Map(canvas, mapOptions);
        
  })
```

* lets go to geolocation api, explain what it is...

* and a bit of html:

```
  <div class="col-md-4">
      <h3>GEOLOCATION</h3>
      <button class="btn btn-default" id="current_position">Show my position</button>
    </div>

```

* then add to javascript code : 



```
  $("#current_position").on("click", function(){
      if(navigator.geolocation){
        navigator.geolocation.getCurrentPosition(updateLocation,handleLocationError);
        navigator.geolocation.watchPosition(updateLocation,handleLocationError);
      }
      else{
        alert("Oops! This browser does not support HTML5 Geolocation");
      }
    })
```
  
* And the 2 functions to handle results

```
function updateLocation(position){
  var coords = position.coords;
  var latlng = new google.maps.LatLng(coords.latitude,coords.longitude);
  var markerBounds = new google.maps.LatLngBounds();
  var marker = new google.maps.Marker({
      position: latlng,
      map: map,
      title: 'You are here'
  });
  map.setCenter(latlng);
  map.setZoom(17)
}

function handleLocationError(error){
  console.log(error)
}
```


* now let's talk about autocomplete


* Add the form to handle autocomplete

```
  <div class="row">
    <div class="col-md-4">
      <h3>AUTOCOMPLETE</h3>
      <form class="row" role="search" id="places_form">
        <div class="form-group col-md-12">
          <input type="text" id="autocomplete" class="form-control " placeholder="Search">
        </div>
      </form>
    </div>
```

* then the corresponding javascript

```
  var infowindow = new google.maps.InfoWindow();
      var marker = new google.maps.Marker({
        map: map
      });


      var input = document.getElementById('autocomplete')
      var autocomplete = new google.maps.places.Autocomplete(input);

      autocomplete.bindTo('bounds', map);

      google.maps.event.addListener(autocomplete, 'place_changed', function() {
        infowindow.close();
        marker.setVisible(false);
        var place = autocomplete.getPlace();

        // If the place has a geometry, then present it on a map.
        if (place.geometry.viewport) {
          map.fitBounds(place.geometry.viewport);
        } else {
          map.setCenter(place.geometry.location);
          map.setZoom(17)
        }

        marker.setIcon({
          url: place.icon,
          size: new google.maps.Size(71, 71),
          origin: new google.maps.Point(0, 0),
          anchor: new google.maps.Point(17, 34),
          scaledSize: new google.maps.Size(35, 35)
        });
        marker.setPosition(place.geometry.location);
        marker.setVisible(true);

        var address = '';
        if (place.address_components) {
          address = (place.address_components[0] && place.address_components[0].short_name || '')
        }

        infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
        infowindow.open(map, marker);
      });

```


* last thing is directions

* html

```
  <div class="col-md-4">
      <h3>DIRECTIONS</h3>
      <form class="navbar-left" role="search" id="directions_form" class="row">
        <div class="form-group col-md-4">
          <input type="text" class="form-control " id="directions_from" placeholder="From">
        </div>
        <div class="form-group col-md-4">
          <input type="text" class="form-control col-md-2" id="directions_to" placeholder="To">
        </div>
        <div class="form-group col-md-4">
          <select id="directions_mode">
            <option value="DRIVING">Driving</option>
            <option value="WALKING">Walking</option>
            <option value="BICYCLING">Bike</option>
            <option selected value="TRANSIT">Public transport</option>
          </select>
        </div>
        <div class="form-group col-md-4">
          <button type="submit" class="btn btn-default">Submit</button>
        </div>
      </form>
    </div>
```

* and javacsript

```
   $("#directions_form").on("submit", function(){
        from = $("#directions_from").val()
        to = $("#directions_to").val()
        mode = $("#directions_mode").val()
        var request = {
            origin:from,
            destination:to,
            travelMode: google.maps.TravelMode[mode]
      };

        directionsService = new google.maps.DirectionsService();
        directionsDisplay = new google.maps.DirectionsRenderer();
        directionsDisplay.setMap(map);
        directionsService.route(request, function(response, status) {
          if (status == google.maps.DirectionsStatus.OK) {
            directionsDisplay.setDirections(response);
            $("#directions-panel").html()
            directionsDisplay.setPanel(document.getElementById('directions-panel'));

          }
          else{
            alert("something went wrong!")
          }
        });        
        return false;
      })
```