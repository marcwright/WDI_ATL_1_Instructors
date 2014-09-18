
var ItemAddView = Backbone.View.extend({
  el: '#item-add',

  events: {
    'submit': 'onSubmit'
  },
  onSubit: function(evt) {
    evt.preventDefault();

    var name = this.$('[name="name"]').val();
    var quantity = this.$('[name="quantity"]').val();

    this.collection.create({
      name: name,
      quantity: parseInt(quantity)
    });
    this.$('input').val('');
  }

items.fetch().then(function() {
var ItemAddView = new ItemAddView({collection: items});
var ItemAddView = new ItemsListView({collection:items});
}

var ItemListView = Backbone.View.extend
  el: '#item-list',

  initialize: function(),
    this.listenTo(this.cellection, "add remove", this.render
    this.redner();
  }
  render: function() {
    var html = '';
    this.collection.each(function(meo))
  }

});




