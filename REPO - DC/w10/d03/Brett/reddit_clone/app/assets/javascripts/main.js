$(function(){
  var posts = new PostCollection();
  var postsView = new ListView({collection: posts});
  var formView = new FormView({collection: posts});
  posts.fetch();
})
