
// a Model for individual muppet list items:
var MuppetModel = Backbone.Model.extend({
  defaults: {
    name: '',
    image: '',
    rating: 1
  },

  vote: function(modifier) {
    var currentRating = this.get('rating');
    this.save({rating: currentRating += modifier});
    this.collection.sort();
  }

});

//a Collection for a list of muppet items:
var MuppetsCollection = Backbone.Collection.extend({
  model: MuppetModel,
  localStorage: new Backbone.LocalStorage('muppets'),
  comparator: 'rating'
});

//what does the below accomplish, and why does it look like I am calling a function?
var muppets = new MuppetsCollection();
