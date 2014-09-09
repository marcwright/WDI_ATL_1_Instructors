
// Muppet Model:

var Muppet = Backbone.Model.extend({
  defaults: {
    name: '',
    image: '',
    rating: 3
  },

  upvote: function(modifier) {
    this.save('rating', this.get('rating') + modifier);
    this.collection.sort();
  }
});


// Muppet Collection:

var Muppets = Backbone.Collection.extend({
  model: Muppet,
  localStorage: new Backbone.LocalStorage("muppets"),

  comparator: function(a, b) {
    var dif = a.get('rating') - b.get('rating');
    return dif ? dif : a.get('name').localeCompare(b.get('name'));
  }
});


// Muppets Collection Instance:

var muppets = new Muppets();
