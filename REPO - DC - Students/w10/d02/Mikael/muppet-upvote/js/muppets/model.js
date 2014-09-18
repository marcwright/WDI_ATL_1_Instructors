// Create a Muppet model for managing a muppet's name, image, and rating

var MuppetModel  = Backbone.Model.extend({

  defaults: {
    name: '',
    image: '',
    rating: 0
  },

  upVote: function(mod) {
    // this.set('rating') += parseInt(num);
    // this.save();
    var rating = this.get('rating');
    this.save({rating: rating + mod});
  }


});

var MuppetCollection = Backbone.Collection.extend({
  model: MuppetModel,
  localStorage: new Backbone.LocalStorage('muppets'),
  comparator: 'rating'
});

var kermit = new MuppetModel();
var muppets = new MuppetCollection();
