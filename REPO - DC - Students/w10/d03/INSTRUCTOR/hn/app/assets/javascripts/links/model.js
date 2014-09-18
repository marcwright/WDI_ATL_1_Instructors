var Link = Backbone.Model.extend({
  defaults: {
    url: '',
    title: '',
    votes: 0
  },

  upvote: function(){
    this.save('votes', this.get('votes') + 1);
    this.collection.sort();
  }
});

var LinkCollection = Backbone.Collection.extend({
  model: Link,
  url: "/links",
  comparator: function(a, b) {
    return b.get('votes') - a.get('votes');
  }
});