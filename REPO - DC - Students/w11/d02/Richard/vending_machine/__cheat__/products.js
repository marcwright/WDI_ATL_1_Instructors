define(function(require) {

  // Imports:

  var Backbone = require('backbone');
  var currency = require('../helpers/currency');

  // Implementation:

  var Product = Backbone.Model.extend({
    defaults: {
      code: '',
      name: '',
      price: 0,
      quantity: 0
    },

    purchase: function() {
      var quantity = this.get('quantity');

      if (quantity > 0) {
        this.save('quantity', quantity-1);
      }
    },

    price: function() {
      return currency.formatCents(this.get('price'));
    }
  });


  var Products = Backbone.Collection.extend({
    model: Product,
    url: '/products'
  });

  return new Products();
});


