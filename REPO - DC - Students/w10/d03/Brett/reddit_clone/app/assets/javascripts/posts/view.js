var PostView = Backbone.View.extend({
  tagName: "div",
  className: "post",

  initialize: function() {
    this.listenTo(this.model, "change", this.render);
    this.render();
  },

  events: {
    "click span" : "onUpvote"
  },

  onUpvote: function() {
    this.model.upvote();
  },

  template: _.template($("#post-html").html()),

  render: function() {
    var rendered = this.template({post: this.model});
    this.$el.html(rendered);
  }

});

var ListView = Backbone.View.extend({
  el: "#container",

  initialize: function() {
    this.listenTo(this.collection, "add", this.addOne);
  },

  addOne: function(post) {
    var view = new PostView({model: post});
    this.$el.append(view.el);
  }

});

var FormView = Backbone.View.extend({

  el: "form",

  events: {
    "submit" : "createPost"
  },

  createPost: function(evt) {
    evt.preventDefault();
    var url = this.$("[name='url']").val();
    this.el.reset();

    this.collection.create({
      url: url
    });
  }
});
