var MuppetModel = Backbone.Model.extend({
  defaults: {
    name: '',
    image: '',
    rating: 0
  },

  makevote: function(vote) {
    var rating = this.get("rating");
    rating += vote;
    this.save({rating: rating});
  }
});


var MuppetsCollection = Backbone.Collection.extend({
  model: MuppetModel,
  localStorage: new Backbone.LocalStorage('muppetStore')
});

var muppets = new MuppetsCollection();

muppets.comparator = function(muppet) {
  return -muppet.get('rating');
};

