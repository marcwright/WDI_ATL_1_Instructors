$(function(){
  var articles = new ArticleCollection();
  var articlesView = new ListView({collection: articles});
  var formView = new FormView({collection: articles});
  articles.fetch();
});
