$(function(){
  getPins();
})

function getPins() {

    $.ajax({
      url: "/pins",
      type: "GET",
      dataType: "json",
    })
    .then(function(data)){

    }
  });
}

function postPins(){
  $("body").on("click", function(){
  evt.preventDefault();

  pointX = evt.pageX;
  pointY = evt.pageY;
}
