$(function(){
  var links = new LinkCollection();
  var formView = new FormView({collection: links});
  var listView = new ListView({collection: links});
  links.fetch();
})