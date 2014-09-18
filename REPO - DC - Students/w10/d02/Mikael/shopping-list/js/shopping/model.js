// A Model for individual shopping list items:
var ItemModel = Backbone.Model.extend({

  defaults: {
    name: '',
    quantity: 0
  }
});

// A Collection for a list of shopping items:
var ItemsCollection = Backbone.Collection.extend({
  model: ItemModel,
  localStorage: new Backbone.LocalStorage('shopping')
});

var items = new ItemsCollection();
