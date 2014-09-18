var LinkView = Backbone.View.extend({
  tagName: 'div',
  className: 'link',

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

  template: _.template($('#link-html').html()),

  render: function(){

    var rendered = this.template({ link: this.model });
    this.$el.html(rendered);
  }
});

var ListView = Backbone.View.extend({
  el: '#container',
  
  initialize: function(){
    this.listenTo(this.collection, 'add remove sort', this.render);
  },

  addOne: function(link){
    var view = new LinkView({ model: link });
    this.$el.append(view.el);
  }
});

var FormView = Backbone.View.extend({
  el: 'form',

  events: {
    'submit' : 'createLink'
  },

  createLink: function(evt){
    evt.preventDefault();
    var title = this.$('[name="title"]').val();
    var votes = this.$('[name="votes"]').val();
    var url = this.$('[name="url"]').val();
    this.el.reset();
  
    this.collection.create({
      title: title,
      votes: votes,
      url: url
    });
  }
});
