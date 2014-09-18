var LinkView = Backbone.View.extend({
  tagName: 'div',
  className: 'link',

  initialize: function() {
    this.listenTo(this.model, 'change', this.render);
    this.listenTo(this.model, 'destroy', this.remove);
    this.render();
  },

  events: {
    'click span' : 'onRemove',
    'click button#up' : 'onUpvote',
    'click button#down' : 'onDownvote',
  },

  onRemove: function() {
    this.model.destroy();
  },

  onUpvote: function() {
    this.model.addUpvote();
  },

  onDownvote: function() {
    this.model.subtractUpvote();
  },

  template: _.template($('#link-html').html()),

  render: function() {
    var rendered = this.template({link: this.model});
    this.$el.html(rendered);
  }
});

var ListView = Backbone.View.extend({
  el: '#container',

  initialize: function() {
    this.listenTo(this.collection, 'add remove change sort', this.render);
  },

  render: function() {
    this.$el.empty();
    var $e = this.$el;

    this.collection.each(function(one) {
      var view = new LinkView({model: one});
      $e.append(view.el);
    });
  }
});

var FormView = Backbone.View.extend({

  el: 'form',

  events: {
    'submit' : 'createLink'
  },

  createLink: function(evt) {
    evt.preventDefault();

    var url = this.$('[name="url"]').val();
    this.el.reset();

    this.collection.create({
      url: url
    });
  }
});
