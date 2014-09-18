var LinkModel = Backbone.Model.extend({

  defaults: {
    title: '',
    url: '',
    upvotes: 0
  },

  addUpvote: function() {
    this.save('upvotes', this.get('upvotes') + 1);
    this.collection.sort();
  },

  subtractUpvote: function() {
    this.save('upvotes', this.get('upvotes') - 1);
    this.collection.sort();
  }
});


var LinkCollection = Backbone.Collection.extend({

  model: LinkModel,
  url: '/links',

  comparator: function(model) {
    return -model.get('upvotes');
  }
});
