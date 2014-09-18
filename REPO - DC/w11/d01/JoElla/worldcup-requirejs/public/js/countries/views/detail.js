// Requires:
// - Backbone
// - Underscore
// - Text: detail.html

define(function(require){

  var Backbone = require('backbone');
  var _ = require('underscore');
  //requiring the html file that templates what's in the model
  var templateText = require('text!../templates/detail.html');

  var CountryDetailView = Backbone.View.extend({
    template: _.template( templateText ),

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
