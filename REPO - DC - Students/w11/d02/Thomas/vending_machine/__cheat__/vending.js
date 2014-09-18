define(function(require) {

  // Imports:
  var Backbone = require('backbone');
  var LocalStorage = require('backbone-localstorage');
  var currency = require('../helpers/currency');
  var products = require('./products');

  // Implementation:
  var VendingMachine = Backbone.Model.extend({
    localStorage: new LocalStorage("vending"),

    defaults: {
      id: 1,
      change: 0,
      credit: 0,
      purchases: [],
      selection: ''
    },

    addCredit: function(cents) {
      var current = this.get('credit');
      this.save('credit', current + cents);
      this.vend();
    },

    addSelectionDigit: function(digit) {
      var selection = this.get('selection') + digit;
      this.save('selection', selection);

      if (selection.length >= 2) {
        this.vend();
      }
    },

    clearSelection: function() {
      this.save({selection: ''});
    },

    vend: function() {
      var state = this.toJSON();
      var product = products.findWhere({code: state.selection});

      if (!product) {
        // Invalid selection:

        this.clearSelection();
        this.status('Please enter a valid selection');

      } else if (product.get('quantity') <= 0) {
        // Out of stock:

        this.clearSelection();
        this.status('Please enter a valid selection');

      } else if (product.get('price') > state.credit) {
        // Not enough credit:

        var diff = product.get('price') - state.credit;
        this.status('Please insert an additional '+ currency.formatCents(diff));

      } else {
        // Complete transaction:

        product.purchase();

        this.save({
          credit: state.credit - product.get('price'),
          purchases: state.purchases.concat(product.get('name'))
        });

        this.refund();
      }
    },

    refund: function() {
      this.save({
        credit: 0,
        change: this.get('change') + this.get('credit'),
        selection: ''
      });
    },

    status: function(message) {
      this.trigger('status', message);
    }
  });
  
  return new VendingMachine();
});