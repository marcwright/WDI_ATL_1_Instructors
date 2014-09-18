$(function(){
  var map;
  var infowindow;
  function addInfoWindowForCamera(camera, marker){
    google.maps.event.addListener(marker, 'click', function() {
      file = camera.file;
      if(infowindow != undefined) infowindow.close()
      infowindow = new google.maps.InfoWindow({
          content: "<img src='http://www.tfl.gov.uk/tfl/livetravelnews/trafficcams/cctv/"+file+"'><p>"+camera.location+"("+camera.postcode+")</p>"
      });
      
      infowindow.open(map,this);
    });
  }

  function createMarkerForCamera(camera){
      
      var latlng = new google.maps.LatLng(camera.lat, camera.lng);
      marker = new google.maps.Marker({
        position: latlng,
        map: map,
        title:"Hello World!",
      });
      addInfoWindowForCamera(camera, marker)
  }


  function mapCameras(cameras){
    _(cameras).each(function(camera){
      
      createMarkerForCamera(camera)
    })
  }

  function initialize(){
    var mapOptions = {
      zoom: 12,
      center: new google.maps.LatLng(51.506178,-0.088369),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
    $.ajax({
      type: 'GET',
      url: "/cameras",
      dataType: 'json',
      success: mapCameras
    })
  }
  //   
  //   markers = []
  //   for(var i = 0;i < window.cameras.length; i++){



  //   }
    
  // }
  initialize()
});