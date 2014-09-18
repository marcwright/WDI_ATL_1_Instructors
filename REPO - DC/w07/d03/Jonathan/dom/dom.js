// Red on purple background
function addColorToMagneto() {
  var magneto = document.getElementById('bad-guy-list').children[0];
  magneto.style.color = 'red';
  magneto.style.background = 'purple';
}

addColorToMagneto();


// Add the big class to the title
function addBigClassToTitle {
  var bigClass = document.querySelector('h1');
  bigClass.classList.toggle('big');
}

//
function changeTagFont(tagName, fontFamily) {

  var elems = document.getElementsByTagName(tagName);

  for (var i = 0; i < elems.length; i++) {
    elems[i].style.fontFamily = fontFamily;
  }
}



changeTagFont();
