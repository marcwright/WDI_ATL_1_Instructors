define(function(require) {

  // Imports:

  var Backbone = require('backbone');
  var vending = require('../models/vending');

  // Implementation:
  
  var KeypadView = Backbone.View.extend({
    el: '#keypad',

    events: {
      'click [data-key]': 'onKey'
    },

    onKey: function(evt) {
      evt.preventDefault();
      var key = $(evt.target).attr('data-key');

      if (key === 'clear') {
        this.model.clearSelection();
      } else {
        this.model.addSelectionDigit(key);
      }
    }
  });

  return new KeypadView({model: vending});
});