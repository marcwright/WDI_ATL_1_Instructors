var Story = Backbone.Model.extend({
  // urlRoot: '/stories',
  defaults: {
    title: '',
    url: ''
  },

  //behavior

});

var StoryCollection = Backbone.Collection.extend({
  model: Story,
  url: '/stories'
});
