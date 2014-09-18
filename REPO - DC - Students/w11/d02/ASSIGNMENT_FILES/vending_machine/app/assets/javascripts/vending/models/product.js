define(function(require){

  var Backbone = require("backbone");

  var Product = Backbone.Model.extend({
    defaults: {
      code: '',
      name: '',
      price: '',
      quantity: 1,
    },
  });

  var ProductCollection = Backbone.Collection.extend({
    model: Product,
    url: '/products',
  });

  return ProductCollection;
});
