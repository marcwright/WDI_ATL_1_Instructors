$(function(){
  var map, infowindow;
  function addInfoWindowForCamera(marker, camera){
    // this method should handle the creating and displaying the infowindow 
    // If an infowindow is already open , it should close it before opening a new one
    // maybe that's why var infowindow above is in the global scope...
    "<img src='http://www.tfl.gov.uk/tfl/livetravelnews/trafficcams/cctv/"+file+"'><p>"+camera.location+"("+camera.postcode+")</p>"
  }

  function createMarkerForCamera(camera){
    // here we should define a marker object and add it to the map 
    // then attach an info window to the marker 
  }


  function mapCameras(cameras){
    // this method should go through each object in the array and delegate the creation of the marker to another method... 
  }

  function initialize(){
    // This method should create the map and do an ajax call to get the cameras data
  }
  
  initialize()
});