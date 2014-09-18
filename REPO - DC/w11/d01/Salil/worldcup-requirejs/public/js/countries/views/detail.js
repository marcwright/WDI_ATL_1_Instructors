define(function(require){


  // Requires:
  var Backbone = require('backbone');
  var _ = require('underscore');
  var templateText = require('text!../templates/detail.html')


  var CountryDetailView = Backbone.View.extend({
    template: _.template( $('#country-detail').html() ),

    render: function() {
      var rendered = this.template(this.model.toJSON());
      return this.$el.html(rendered);
    },

    events: {
      'change [name="playing"]': 'onPlaying',
      'change [name="eliminated"]': 'onEliminated'
    },

    onPlaying: function() {
      var checked = this.$('[name="playing"]').prop('checked');
      this.model.set('isPlaying', checked);
    },

    onEliminated: function() {
      var checked = this.$('[name="eliminated"]').prop('checked');
      this.model.set('isEliminated', checked);
    }
  });
  return CountryDetailView;
});
