define(function(require) {

  // Imports:

  var Backbone = require('backbone');
  var currency = require('../helpers/currency');
  var vending = require('../models/vending');
  
  // Implementation:

  var ChangeView = Backbone.View.extend({
    el: '#change',
    
    initialize: function() {
      this.listenTo(this.model, 'change:change', this.render);
    },

    render: function() {
      var change = this.model.get('change');
      this.$el.text(change ? currency.formatCents(change) : '');
    },

    events: {
      'click': 'onClaim'
    },

    onClaim: function(evt) {
      evt.preventDefault();
      this.model.save('change', 0);
    }
  });

  return new ChangeView({model: vending});
});
