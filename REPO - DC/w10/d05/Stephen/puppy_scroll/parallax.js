/*
* @Author: stephenstanwood
* @Date:   2014-06-27 09:04:59
* @Last Modified by:   stephenstanwood
* @Last Modified time: 2014-06-27 09:45:04
*/

$( window ).scroll( 'scroll', parallax );

function parallax() {
  var scrolled = $( window ).scrollTop();
  $( '.bg' ).css( 'top', scrolled * -1.5 + 'px' );
  $( '.top-left' ).css( 'top', scrolled * 0.8 + 'px' );
}
