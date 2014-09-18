var Article = Backbone.Model.extend({
  urlRoot: '/articles',

  defaults: {
    title: '',
    url: '',
    votes: 0
  },

  getVote: function(vote){
    var votes = this.get("votes");
    votes += vote;
    this.save({votes: votes});
    this.collection.sort();

    //this.save('votes', this.get('votes') +1)
  }

});

var ArticleCollection = Backbone.Collection.extend({
  model: Article,
  url: '/articles',
  comparator: function(article){
    return -article.get('votes');
  }
});


