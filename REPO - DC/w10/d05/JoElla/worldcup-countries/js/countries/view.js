var CountryView = Backbone.View.extend({
  tagName: 'div',
  className: 'country-detail',

  template: _.template($('#country-detail').html()),

  initialize: function(){
    console.log(this.collection);
    // this.listenTo(this.model, 'change sync', this.render);
    // this.render();
  },

  render: function(){
    var rendered = this.template(this.model.toJSON());
    return this.$el.html(rendered);
  },

  events: {
    'click [type="checkbox"]' : 'isChecked'
  },

  isChecked: function(){
    //this.model.set
  }

});

var CountryListItemView = Backbone.View.extend({
  el: 'li',
  template: _.template($('#country-main').html()),

  initialize: function(){
    // this.listenTo(this.collection, 'change', this.render);
    // this.render();
  },

  render: function() {
    var rendered = this.template({countries: this.collection});
    return this.$el.html(rendered);
  }
});


var countryView = new CountryView({ collection: countriesCollection});
countryView.render().appendTo('#country-detail');

var countryListItemView = new CountryListItemView({ collection: countriesCollection});
countryListItemView.render().appendTo('#country-main');


