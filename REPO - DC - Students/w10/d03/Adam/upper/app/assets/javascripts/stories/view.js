var StoryView = Backbone.View.extend({
  tagName: 'div',
  className: 'story',

  initialize: function(){
    this.listenTo(this.model, 'change', this.render);
    this.listenTo(this.model, 'destroy', this.remove);
    this.render();
  },

  events: {
    'click span' : 'onRemove'
  },

  onRemove: function(){
    this.model.destroy();
  },

  template: _.template($('#story-html').html()),

  render: function(){

    // var rendered = '<h2>' + this.model.get('name') + ' -- '
    //   + this.model.get('coins') + '</h2>'
    //   + '<span> &times; </span>'
    //   + '<img src="' + this.model.get('img_url') + '"/>';

    var rendered = this.template({story: this.model});
    this.$el.html(rendered);
  }

});

var ListView = Backbone.View.extend({
  el: '#container',

  initialize: function(){
    this.listenTo(this.collection, 'add', this.addOne);
  },

  addOne: function(story){
    var view = new StoryView({model: story});
    this.$el.append(view.el);
  }

});

var FormView = Backbone.View.extend({

  el: 'form',

  events: {
    'submit' : 'createStory'
  },

  createStory: function(evt){
    evt.preventDefault();
    var title = this.$('[name="title"]').val();
    var url = this.$('[name="url"]').val();
    this.el.reset();

    this.collection.create({
      title: title,
      url: url
    });
  }

});
