var Post = Backbone.Model.extend({

  defaults: {
    url: "",
    title: "",
    upvotes: 1
  },

  upvote: function(){
    this.save("upvotes", this.get("upvotes") + 1);
  }

});

var PostCollection = Backbone.Collection.extend({
  model: Post,
  url: "/posts"
});
