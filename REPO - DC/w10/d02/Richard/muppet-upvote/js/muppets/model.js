/*
* @Author: Richard Hessler
* @Date:   2014-06-24 16:01:28
* @Last Modified by:   Richard Hessler
* @Last Modified time: 2014-06-25 01:29:54
*/

// Create a Muppet model for managing a muppet's `name`, `image`, and `rating`.
var MuppetModel = Backbone.Model.extend({

  defaults: {
    name: '',
    image: '',
    rating: 0
  },

  // Add an additional "upvote" method onto the model. It should accept either "1" or "-1" as an argument,
  // and use that value to adjust the model's rating.
  upvote: function( rating ) {
    var currentRating =  this.get('rating');
    var newRating     =  parseInt( currentRating ) + parseInt( rating );
    this.set( 'rating', newRating );
    this.save();
    this.render();
  }
});

// Create a Muppets collection for managing a list of Muppet models.
var MuppetCollection = Backbone.Collection.extend({
  model: MuppetModel,
  localStorage: new Backbone.LocalStorage( 'storage' )
});

// Create an instance of your Muppets collection.
var muppets = new MuppetCollection();

muppets.comparator = function( model ) {
    return -model.get( 'rating' );
};

this.render();
