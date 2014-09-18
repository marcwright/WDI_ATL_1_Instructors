$(document).ready(function() {
  $('body').append('<img src="http://placekitten.com/200/300" class="cat">')
  $('body').append('<img src="http://people.ucsc.edu/~ddiep1/puppy.jpg" class="dog">')
  $('body').append('<img src="http://static.artfcity.com/wp-content/uploads/2013/10/Cute-Panda-Bears-animals-34916401-1455-1114-620x474.jpg" class="panda">')
  // $(document).mousemove(function() {
  //   $('body').append('<h1>this.pageX + ", " + this.pageY</h1>')
  // })
  $('img').click(function() {
    $(this).addClass('.border')
  })

})
