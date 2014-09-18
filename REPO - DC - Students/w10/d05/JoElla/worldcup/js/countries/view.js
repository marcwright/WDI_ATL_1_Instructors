var CountryView = Backbone.View.extend({
  tagName: 'div',
  className: 'country-detail',

  template: _.template($('#country-detail').html()),

  initialize: function(){
    this.listenTo(this.model, 'change sync', this.render);
    this.render();
  },

  render: function(){
    var rendered = this.template({country: this.model});
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
    this.listenTo(this.collection, 'change', this.render);
    this.render();
  },

  render: function() {
    var rendered = this.template({countries: this.collection});
    return this.$el.html(rendered);
  }


});


