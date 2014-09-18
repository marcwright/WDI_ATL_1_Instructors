#Mapp.er

A user will be able to:
- See all the pins that have been added
- Add a new pin by clicking anywhere on the map

This app will use 2 AJAX requests:
- A get request which will retrieve all pins in the database
- A post request which will add a new pin when the user clicks on the map

### Getting Started

To start:
- Create your Rails model, controller, and view.
- You will need a Pin model with 2 attributes: longitude and latitude.  Both should be stored as floats.
- Optionally seed some sample data.
- You should implement INDEX and CREATE methods for your Pin, both of which should respond with JSON.
- You will also need to decide on where your app's main content will live.  In mine, I used NEW as the main page of the app, but it doesn't really matter.

Check out [how to get a simple Google map up](https://developers.google.com/maps/documentation/javascript/tutorial). Note: You should be able to get it working without signing up for an API key.

### Displaying Pins

Once you have the map up and running, you can add a pin using the following code:

```
var location = new google.maps.LatLng(-34.139, 150.699);
var newMarker = new google.maps.Marker({
  position: location,
  map: map
});
```

You will need to do an AJAX get request to your INDEX to retrieve all the pins.  Then, you will need to loop through the returned data and create a pin for each Pin.

### Creating Pins

To add a pin when the user clicks on the map, you will need to call an AJAX post request whenever the user clicks on the map.  The maps API has a special event listener for us to use:

```
  google.maps.event.addListener(map, 'click', function(event) {
  //YOUR AJAX POST GOES IN HERE
});
```

If your AJAX call is successful, you should get back the data about the Pin you stored in your database and create a new Google Maps marker with the data.

### Beyond

Explore more of the Google Maps API!

Some things you might want to check out:
- Using a custom icon
- Animating markers
- Creating Info Windows
- Different map types
