var MuppetModel = Backbone.Model.extend({

  defaults: {
    'name': '',
    'image': '',
    'rating': 0
  },

  upvote: function(vote){
    this.attributes.rating += parseInt(vote);
    this.save();
  }

});

///////////////////////////////////////////////////////////////

var MuppetCollection = Backbone.Collection.extend({
  model: MuppetModel,
  localStorage: new Backbone.LocalStorage('muppets'),

  comparator: function(model){
    return -model.get('rating');
  }
});

var muppetCollection = new MuppetCollection();

