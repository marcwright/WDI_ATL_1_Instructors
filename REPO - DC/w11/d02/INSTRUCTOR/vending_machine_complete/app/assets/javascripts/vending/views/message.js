define(function(require) {

  // Imports:
  var Backbone = require('backbone');
  var currency = require('../helpers/currency');
  var vending = require('../models/vending');

  // Implementation:
  var MessageView = Backbone.View.extend({
    el: '#message',
    status: '',

    initialize: function() {
      this.listenTo(this.model, 'change:credit change:selection', this.render);
      this.listenTo(this.model, 'status', this.renderStatus);
      this.render();
    },

    render: function() {
      var state = this.model.toJSON();
      var messages = [];
      messages.push('Credit: '+ currency.formatCents(state.credit));
      messages.push('Selection: '+ state.selection);

      this.$el.html(this.status ? this.status : messages.join('<br>'));
    },

    renderStatus: function(message) {
      var self = this;
      this.status = message;
      this.$el.html(message);

      setTimeout(function() {
        self.status = '';
        self.render();
      }, 2000);
    }
  });

  return new MessageView({model: vending});
});