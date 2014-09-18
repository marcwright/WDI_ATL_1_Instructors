
var Link = Backbone.Model.extend({

  defaults: {
    title: '',
    url: '',
    votes: 0
  },

  upVote: function(vote){
    this.attributes.votes += parseInt(vote);
    this.save();
    this.collection.sort();
  },
});

var LinkCollection = Backbone.Collection.extend({
  model: Link,
  url: '/links',

  comparator: function(model){
    return -model.get('votes');
  }

});
