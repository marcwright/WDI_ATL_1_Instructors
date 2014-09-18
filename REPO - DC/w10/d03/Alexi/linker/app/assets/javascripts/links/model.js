var Link = Backbone.Model.extend({
  urlRoot: '/links',
  
  defaults: {
    title: '',
    url: '',
    votes: 1
  },

  getLink: function(){
    this.save('votes', this.get('votes') + 1);
    this.collection.sort();
  }
});

var LinkCollection = Backbone.Collection.extend({
  model: Link,
  url: '/links'
});
