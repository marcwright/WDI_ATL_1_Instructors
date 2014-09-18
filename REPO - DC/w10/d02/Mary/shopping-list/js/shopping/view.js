var ItemAddView = Backbone.View.extend({
  el: '#item-add',

  events: {
    'submit': 'onSubmit'
  },

  onSubmit: function(evt) {
    evt.preventDefault();
    // uses attributes of tags to select
    var name = this.$('[name="name"]').val();
    var quantity = this.$('[name="quantity"]').val();
    this.collection.create({
      name: name,
      quantity: parseInt(quantity)
    });
    this.$('input').val('');
  }
});

var ItemListView = Backbone.View.extend({
  el: '#item-list',

  initialize: function() {
    this.listenTo(this.collection, 'add remove', this.render);
    this.render();
  },

  render: function() {
    var html = '';
    this.collection.each(function(model) {
      html += '<li>' + model.get('name') + ' (' + model.get('quantity') + ')<button data-remove="' + model.cid + '">X</button></li>'
    });
    this.$el.html(html);
  },

  events: {
    'click [data-remove]': 'onRemove'
  },

  onRemove: function(evt) {
    var cid = $(evt.target).data('remove');
    var model = this.collection.get(cid);
    model.destroy();
  }
});

// go back to local storage and pull that data out
items.fetch().then(function() {
  var itemAddView = new ItemAddView({collection: items});
  var itemListView = new ItemListView({collection: items})
});
