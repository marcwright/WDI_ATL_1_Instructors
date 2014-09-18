$(function(){
  var stories = new StoryCollection();
  var storiesView = new ListView({collection: stories});
  var formView = new FormView({collection: stories});
  stories.fetch();
});
