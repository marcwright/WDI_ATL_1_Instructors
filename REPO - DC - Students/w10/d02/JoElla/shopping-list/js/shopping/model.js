var ItemModel = Backbone.Model.extend({
  defaults: {
    name: '',
    quantity: 0
    }
})

var ItemsCollection = Backbone.Collection.extend({
  model: ItemModel,
  localStorage: new Backbone.LocalStorage('shopping')
});

var items = new ItemsCollection();
