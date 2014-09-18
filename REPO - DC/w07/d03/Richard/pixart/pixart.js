/*
* @Author: Richard Hessler
* @Date:   2014-06-04 16:18:10
* @Last Modified by:   Richard Hessler
* @Last Modified time: 2014-06-04 17:31:43
*/
var brush = document.querySelector('.brush');

/* Commit 1 */
function colorize() {
  var form = document.getElementById('set-color');
  form.addEventListener('click', function(e) {
    e.preventDefault();
    var color = document.getElementById('color-field').value;
    document.querySelectorAll('div')[1].style.backgroundColor=color;
  });
}
colorize();

function createDivs() {
  for(var i = 200000; i > 0; i--){
  var div = document.createElement('div');
  div.setAttribute('class','square');
  div.addEventListener('mouseover', function(){
    this.style.backgroundColor = brush.style.backgroundColor;
  })
  document.body.appendChild(div);
}
}
createDivs();
/* Commit 2 */


