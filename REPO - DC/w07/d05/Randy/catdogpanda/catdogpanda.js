var body = $('body');
var h1 = $('h1');
var cat = $('<img src="http://weknowmemes.com/wp-content/uploads/2013/02/cat-boner.jpg"/>');
cat.attr('class', "cat");
var dog = $('<img src="http://img3.wikia.nocookie.net/__cb20080731070912/uncyclopedia/images/6/6f/Stupid_dog.jpg"/>');
dog.attr('class', 'dog');
var panda = $('<img src="http://7monthsfor7sins.files.wordpress.com/2011/07/pan-porn.jpg"/>');
panda.attr('class', 'panda');

body.append(cat);
body.append(dog);
body.append(panda);

body.mousemove(function(event){
  var width = ($(document).width())/255;
  var height = ($(document).height())/255;
  var pageX = parseInt(event.pageX / width);
  var pageY = parseInt(event.pageY / height);
  body.css("background-color", "rgb("+pageX+","+pageY+","+pageX+")");

  h1.text('(' + event.pageX + ', ' + event.pageY + ')');
  cat.css({'margin-left' : event.pageX/6, 'margin-top' : event.pageY/6});
  dog.css({'margin-left' : event.pageX/18, 'margin-top' : event.pageY/18});
  panda.css({'margin-left' : event.pageX/12, 'margin-top' : event.pageY/12});
});

var image = $('img');

image.on('click', function(event){
  event.stopPropagation();
  $(this).toggleClass('blue-border');
});

body.on('click', function(){
  body.off('mousemove');
});




