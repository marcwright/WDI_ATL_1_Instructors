var LinkView = Backbone.View.extend({
  tagName: 'li',

  initialize: function() {
    this.listenTo(this.model, 'change', this.render);
    this.listenTo(this.model, 'destroy', this.remove);
    this.render();
  },

  events: {
    'click span.destroy' : 'onRemove',
    'click span.upvote' : 'onUpvote'
  },

  onRemove: function() {
    this.model.destroy();
  },

  onUpvote: function() {
    this.model.upvote();
  },

  template: _.template($("#link-html").html()),

  render: function() {
    var rendered = this.template({ link: this.model });
    this.$el.html(rendered);
  }
});

var ListView = Backbone.View.extend({
  el: "#container",

  initialize: function() {
    this.listenTo(this.collection, "sort add remove", this.render);
  },

  render: function() {
    var partial = document.createDocumentFragment();

    this.collection.each(function(link){
      var view = new LinkView({model: link});
      partial.appendChild(view.el);      
    }, this);

    this.$el.html(partial);
  }
});

var FormView = Backbone.View.extend({
  el: "form",

  events: {
    "submit": "createLink"
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