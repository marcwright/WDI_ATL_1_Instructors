document.getElementById('grayButton').onclick = switchGray;
document.getElementById('whiteButton').onclick = switchWhite;

function switchGray() {
  document.body.style.backgroundColor = 'gray';
  document.body.style.color = 'white';
  document.getElementsByTagName('h1')[0].innerHTML = "Marc's App!"
}

function switchWhite() {
  document.body.style.backgroundColor = 'white';
  document.body.style.color = 'black';
  document.getElementsByTagName('h1')[0].innerHTML = "This is White!"
}
