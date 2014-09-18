/*
* @Author: stephenstanwood
* @Date:   2014-06-24 14:43:11
* @Last Modified by:   stephenstanwood
* @Last Modified time: 2014-06-24 16:54:18
*/

var MuppetModel = Backbone.Model.extend({
  defaults: {
    name: '',
    image: '',
    rating: 1
  },

  toString: function() {
    var res = this.get( 'name' );
    res += ' <img width="200" src="' + this.get( 'image' ) + '">';
    res += this.get( 'rating' );

    return res;
  },

  upvote: function( adj ) {
    var newRating = this.get( 'rating' ) + adj;
    this.save( { rating: newRating } );
  }
});

// a collection for a list of muppets
var MuppetsCollection = Backbone.Collection.extend({
  model: MuppetModel,
  localStorage: new Backbone.LocalStorage( 'muppets' )
});

var muppets = new MuppetsCollection();

// muppets.comparator = function( muppet ) {
//   return ( -1 ) * muppet.get( 'rating' );
// };

muppets.comparator = function( m1, m2 ) {
  if ( m1.get( 'rating') === m2.get( 'rating') ) {
    return m1.get( 'name' ) > m2.get( 'name' );
  }

  return m1.get( 'rating' ) < m2.get( 'rating' );
}
