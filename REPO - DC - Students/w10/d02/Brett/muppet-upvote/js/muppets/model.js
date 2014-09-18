
// A model for each muppet
var MuppetModel = Backbone.Model.extend({

  defaults: {
    name: "",
    image: "",
    rating: 0
  },

  upvote: function(vote) {
    newRating = this.get("rating") + vote;
    this.save({rating: newRating});
  }

});

var MuppetsCollection = Backbone.Collection.extend({
  model: MuppetModel,
  localStorage: new Backbone.LocalStorage("muppets")
});

var muppets = new MuppetsCollection();
muppets.comparator = function(muppet) {
  return -muppet.get("rating"); // Note the minus!
};
