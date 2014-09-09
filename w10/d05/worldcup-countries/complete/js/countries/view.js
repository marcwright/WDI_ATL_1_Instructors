// Country Detail View:

var CountryDetailView = Backbone.View.extend({
  template: _.template($('#country-detail').html()),

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
    this.model.save('isPlaying', checked);
  },

  onEliminated: function() {
    var checked = this.$('[name="eliminated"]').prop('checked');
    this.model.save('isEliminated', checked);
  }
});


// Country Item View:

var CountryListItemView = Backbone.View.extend({
  tagName: 'li',

  initialize: function() {
    this.listenTo(this.model, 'change', this.render);
    this.render();
  },

  render: function() {
    this.$el.toggleClass('playing', this.model.get('isPlaying'));
    this.$el.toggleClass('eliminated', this.model.get('isEliminated'));
    this.$el.html('<a href="#'+ this.model.get('code') +'">'+ this.model.get('name') +'</a>');
  }
});


// Country Listing View:

var CountryListView = Backbone.View.extend({
  el: '#countries-list',

  initialize: function() {
    this.listenTo(this.collection, 'sync reset', this.render);
    this.render();
  },

  render: function() {
    var list = document.createDocumentFragment();

    this.collection.each(function(model) {
      var item = new CountryListItemView({model: model});
      item.render();
      list.appendChild(item.el);
    });

    return this.$el.html(list);
  }
});