var CharacterView = Backbone.View.extend({
  tagName: 'div',
  className: 'character',

  initialize: function() {
    this.listenTo(this.model, 'change', this.render);
    this.listenTo(this.model, 'destroy', this.remove);
    this.render();
  },

  events: {
    'click span' : 'onRemove',
    'click img' : 'onGetCoin'
  },

  onRemove: function() {
    this.model.destroy();
  },

  render: function(){
    var rendered = '<h2>' + this.model.get('name') + ' -- '
      + this.model.get('coins') + '</h2>'
      + '<span> &times; </span>'
      + '<img src="' + this.model.get('img_url') + '"/>';
    this.$el.html(rendered);
  }

});

var ListView = Backbone.View.extend({
  el: '#container',

  initialize: function() {
    this.listenTo(this.collection, 'add', this.addOne);
  },

  addOne: function(character) {
    var view = new CharacterView({model: character});
    this.$el.append(view.el);
  }

});

var FormView = Backbone.View.extend({

  el: 'form',

  events: {
    'submit' : 'createCharacter'
  },

  createCharacter: function(evt) {
    evt.preventDefault();
    var name = this.$('[name="name"]').val();
    var img_url = this.$('[name="img_url"]').val();
    this.el.reset();

    this.collection.create({
      name: name,
      img_url: img_url
    });
  }

});
