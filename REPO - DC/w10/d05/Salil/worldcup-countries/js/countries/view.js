
var CountryDetailView = Backbone.view.extend({
  tagName: 'div',
  className: 'country-detail',
  template: _.template($('#country-detail').html()),

  render: function() {
    var rendered = this.template(this.model.toJSON());
    return this.$el.html(rendered);
  }

  events: {
    'change [name="playing"]': 'goBig',
    'change [name="eliminated"]': 'goHome'
  },

  goBig: function() {
    evt.preventDefault();
    var checked = this.$('[name="playing"]').attr('checked');
    this.model.save('isPlaying', true);
  },

  goHome: function() {
    evt.preventDefault();
    var checked = this.$('[name="eliminated"]').attr('checked');
    this.model.save('isEliminated', true);
  }
});

var CountryListItemView = Backbone.View.extend({
  tagName: 'li',

  initialize: function() {
    this.listenTo(this.model, 'change', this.render);
  },

  render: function() {

  }
});

var CountryListView = Backbone.View.extend({
  el: '#countries-list',

  initialize: function() {
    this.listenTo(this.collection, 'sync reset', this.render);
  },

  render: function() {
    $el.clear();

    this.collection.each(function(model) {

    });


  }
});
