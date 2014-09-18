
// A Model for individual muppets:

var MuppetModel = Backbone.Model.extend({
  defaults: {
    name: '',
    image: '',
    rating: 0
  },

  //A FUNCTION TO ADD 1 or -1 TO THE RATING
  upVote: function(arg) {
    var newRating = this.get("rating") + arg;
    this.save({rating: newRating});
  }

});


// DEFINE A COLLECTION AS MANY MUPPET MODELS:

var MuppetsCollection = Backbone.Collection.extend({
  model: MuppetModel,
  //AND SET LOCAL STORAGE TO PERSIST muppets.
  localStorage: new Backbone.LocalStorage('muppets')
});

//CREATE AN INSTANCE OF MY MUPPETS COLLECTION
var muppets = new MuppetsCollection();
//THIS DOES A SIMPLE SORT BY RATING, PUTTING LOWEST FIRST, which is why I cancelled it ..
// muppets.comparator = 'rating';

//THIS DOES A COMPARISON< AND PUTS HIGHEST FIRST:
muppets.comparator = function(muppet) {
  return -muppet.get("rating"); // Note the minus!
};
