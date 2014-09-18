// Add Item View:

var ItemAddView = Backbone.View.extend({
  el: '#item-add',

  events: {
    'submit': 'onSubmit'
  },

  onSubmit: function(evt) {
    evt.preventDefault();

    var name = this.$('[name="name"]').val();
    var quantity = this.$('[name="quantity"]').val();

    this.collection.create({
      name: name,
      quantity: quantity
    });

    this.$('input').val('');
  }
});


// Items List View:

var ItemListView = Backbone.View.extend({
  el: '#item-list',

  initialize: function() {
    this.listenTo(this.collection, 'add remove', this.render);
    this.render();
  },

  render: function() {
    var html = this.collection.reduce(function(memo, model) {
      return memo + '<li>'+ model.get('name') +' ('+ model.get('quantity') +') <button data-remove="'+ model.cid +'">X</button></li>';
    }, '');

    this.$el.html(html);
  },

  events: {
    'click [data-remove]': 'onRemove'
  },

  onRemove: function(evt) {
    var cid = this.$(evt.target).attr('data-remove');
    var model = this.collection.get(cid);
    model.destroy();
  }
});


// Fetch data, and then create views:

items.fetch().then(function() {
  var itemAddView = new ItemAddView({collection: items});
  var itemListView = new ItemListView({collection: items});
});