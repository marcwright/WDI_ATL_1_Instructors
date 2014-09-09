define(function(require) {

  // Imports:
  
  var Backbone = require('backbone');
  var currency = require('../helpers/currency');
  var vending = require('../models/vending');

  // Implementation:

  var CreditView = Backbone.View.extend({
    el: '#credit',

    events: {
      'submit': 'onCredit',
      'click #refund': 'onRefund'
    },

    onCredit: function(evt) {
      evt.preventDefault();
      
      // Get a reference to the input field:
      var cents = currency.parseCents(this.$('[name="credit"]').val());

      // Add the field's value as credit:
      this.model.addCredit(cents);
      
      // Clear the input field:
      this.el.reset();
    },

    onRefund: function(evt) {
      evt.preventDefault();
      this.model.refund();
    }
  });

  return new CreditView({model: vending});
});