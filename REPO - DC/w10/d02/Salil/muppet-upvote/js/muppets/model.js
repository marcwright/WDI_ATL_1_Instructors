var MuppetModel = Backbone.Model.extend({
  defaults: {
    name: '',
    image: '',
    rating: '',
  }
});

var MuppetsCollection = Backbone.Collection.extend({
  model: MuppetModel,
  localStorage = new Backbone.LocalStorgae('kermit')
});

var muppets = new MuppetsCollection();
muppets.comparator = 'rating';
