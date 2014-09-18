define(function(require) {

  // Imports:
  var _ = require('underscore');
  var Backbone = require('backbone');
  var vending = require('../models/vending');

  // Implementation: 
  var PurchasesView = Backbone.View.extend({
    el: '#purchases',

    initialize: function() {
      this.listenTo(this.model, 'change:purchases', this.render);
      this.render();
    },

    render: function() {
      var purchases = this.model.get('purchases');
      var html = _.reduce(purchases, function(memo, name) {
        return memo += '<li>'+ name +'</li>';
      }, '');

      this.$('ul').html(html);
    },

    events: {
      'click': 'onClaim'
    },

    onClaim: function(evt) {
      evt.preventDefault();
      this.model.save('purchases', []);
    }
  });
  
  return new PurchasesView({model: vending});
});