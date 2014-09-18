var LinkView = Backbone.View.extend({
  tagName: 'li',
  className: 'link',

  initialize: function(){
    this.listenTo(this.model, 'add change', this.render);
    this.render();
  },

  events: {
    'click #upvote': 'onUpVote',
    'click #downvote': 'onDownVote'
  },

  onUpVote: function(){
    this.model.upVote(1);
  },

  onDownVote: function(){
    this.model.upVote(-1);
  },

  render: function(){

    rendered = '<a href="'
    + this.model.get('url') + '">'
    + this.model.get('title') + '</a>'
    + ' -- (' + this.model.get('votes')
    + ')'
    + '<button id="upvote">&#x25B2;</button><button id="downvote">&#x25BC;</button>';

    this.$el.html(rendered);
  },

});

////////////////////////////////////////////////////////////////////////////////////
var ListView = Backbone.View.extend({
  el: '#link-list',

  initialize: function(){
    this.listenTo(this.collection, 'sort', this.render);
  },

  render: function(){
    this.$el.empty();
    this.collection.each(function(model){
      var view = new LinkView({model: model});
      this.$el.append(view.el);
    }, this);
  }
});


//////////////////////////////////////////////////////////////////////////////////////////////////
var FormView = Backbone.View.extend({
  el: 'form',

  events: {
    'submit': 'createLink'
  },

  createLink: function(evt){
    evt.preventDefault();
    var url = this.$('[name="url"]').val();

    this.el.reset();

    this.collection.create({
      url: url
    });
  }
});
