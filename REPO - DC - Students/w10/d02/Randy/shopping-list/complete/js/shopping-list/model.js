
// Item Model:

var Item = Backbone.Model.extend({
  defaults: {
    name: '',
    quantity: 0
  }
});


// Items Collection:

var Items = Backbone.Collection.extend({
  model: Item,
  localStorage: new Backbone.LocalStorage("items")
});


// Items Collection instance:

var items = new Items();
