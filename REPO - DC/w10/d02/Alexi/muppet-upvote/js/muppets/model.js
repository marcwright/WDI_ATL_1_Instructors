var MuppetModel = Backbone.Model.extend({
  defaults: {
    name: '',
    image: '',
    rating: 0
  },

  upvote: function(modifier) {
    // get the current rating from the model
    var currentRating = this.get('rating');
    // modify the current rating with the modifier
    // save the modified rating back into the model
    this.save({rating: currentRating + modifier});
  }
});

var MuppetsCollection = Backbone.Collection.extend({
  model: MuppetModel,
  localStorage: new Backbone.LocalStorage('muppet'),
  comparator: 'rating'
});

var muppets = new MuppetsCollection();
