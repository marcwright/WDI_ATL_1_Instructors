var CountriesListView = Backbone.View.extend({
  tagName: 'div',
  className: 'country-detail',
  template: _.template($('#country-detail').html()),

events: {
  'check box': 'onCheck'
},

onCheck: function(evt) {

}

});

var CountryListItemView = Backbone.View.extend({
  tagName: 'li',

  initialize: function() {
    this.listenTo(this.collection, 'sync', this.render);
  },

  render: function() {

  }

});

var CountryListView = Backbone.View.extend({
  render: function() {

  }
  // When the view renders clear its current content
});

var countryListItemView = new CountryListItemView({ model: country });
var countryListView = new CountryListView({ model: countriesCollection });
});
