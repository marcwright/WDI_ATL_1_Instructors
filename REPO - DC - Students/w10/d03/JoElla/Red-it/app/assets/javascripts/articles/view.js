var ArticleView = Backbone.View.extend({
  tagName: 'div',
  className: 'article',

  initialize: function(){
    this.listenTo(this.model, 'change', this.render);
    this.render();
  },

  events: {
    'click span' : 'onVote',
  },

  onVote: function(){
    this.model.getVote(1);
  },

  template: _.template($('#article-html').html()),

  render: function(){
    var rendered = this.template({article: this.model});
    this.$el.html(rendered);
  }
});

var ListView = Backbone.View.extend({
  el: '#container',

  initialize: function(){
    this.listenTo(this.collection, 'add sort', this.render);
  },

  render: function(){
    this.$el.empty();
    this.collection.each(function(article){
      var view = new ArticleView({model: article});
      this.$el.append(view.el);
    }, this);
  }

});

var FormView = Backbone.View.extend({
  el: 'form',

  events: {
    'submit' : 'createArticle'
  },

  createArticle: function(evt){
    evt.preventDefault();
    var url = this.$('[name="url"]').val();
    this.el.reset();

    this.collection.create({
      url: url
    });
  }
});
