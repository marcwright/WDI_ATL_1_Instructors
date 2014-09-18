$(function(){
  var links = new LinkCollection();
  var linksView = new ListView({collection: links});
  var formView = new FormView({collection: links});
  links.fetch();
});
