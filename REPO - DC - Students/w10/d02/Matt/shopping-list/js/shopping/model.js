
// A model for indidivual shopping list items
var ItemModel = Backbone.Model.extend({
  defaults: {
    name: '',
    quantity: 0
  }
});

// A collection for a list
var ItemsCollection = Backbone.Collection.extend({
  model: ItemModel,
  localStorage: new Backbone.LocalStorage('shopping')
});

var items = new ItemsCollection();
