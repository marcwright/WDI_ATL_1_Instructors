define(function(require) {

  // Imports:

  var _ = require('underscore');
  var Backbone = require('backbone');
  var products = require('../models/products');

  // Implementation:

  var ProductsView = Backbone.View.extend({
    el: '#products',
    template: _.template(require('text!../templates/product.html')),

    initialize: function() {
      this.listenTo(this.collection, 'sync', this.render);
      this.render();
    },

    render: function() {
      var rendered = this.template({products: this.collection});
      return this.$el.html(rendered);
    }
  });
  
  return new ProductsView({collection: products});
});
