
var MuppetModel = Backbone.Model.extend({
  defaults: {
    name: '',
    image: '',
    rating: 0
  },

  upvote: function(vote){
    voteValue = parseInt(vote);
    this.attributes.rating += voteValue;
    this.save();
  }
});

var MuppetsCollection = Backbone.Collection.extend({
  model: MuppetModel,
  localStorage: new Backbone.LocalStorage('muppets_storage'),
  comparator: function(model){
    return -model.get('rating');
  }
});

var muppets = new MuppetsCollection();
