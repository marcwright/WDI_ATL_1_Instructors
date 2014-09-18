var CharacterAddView = Backbone.View.extend({

  el: '#muppet-add',

  events: {
    'submit': 'onSubmit'
  },

  onSubmit: function(evt) {
    evt.preventDefault();

    var name = this.$('[name="name"]').val();
    var image = this.$('[name="image"]').val();
    var rating = this.$('[name="rating"]').val();

    this.collection.create({
      name: name,
      image: image,
      rating: parseInt(rating)
    });

    this.$('input').val('');
  }


});

var CharacterListView = Backbone.View.extend({
  el: '#muppet-list',

  initialize: function() {
    this.listenTo(this.collection, 'add remove', this.render);
    this.render();
  },

  render: function() {
    var html = '';

    this.collection.each(function(model) {
      html += '<li>' + '<img src="' + model.get('image') + '" alt ="' + model.get('name') + '">' + model.get('name') + '<span><button data-id="' + model.cid + '" id="up">&#10506;</button><p>' + model.get('rating') + '</p><button data-id="' + model.cid + '" id="down">&#10507;</button></span><button data-remove="' + model.cid + '">X</button>' + '</li>';
    });

    this.$el.html(html);
  },

  events: {
    'click [data-id]': 'onAdd',
    'click [data-remove]': 'onRemove'
  },

  onAdd: function(evt) {
    var cid = $(evt.target).attr('data-id');
    var model = this.collection.get(cid);

  },

  onRemove: function(evt) {
    var cid = $(evt.target).attr('data-remove');
    var model = this.collection.get(cid);
    model.destroy();
  }

});

characters.fetch().then(function() {
  var characterAddView = new CharacterAddView({collection: characters});
  var characterListView = new CharacterListView({collection: characters});
})
