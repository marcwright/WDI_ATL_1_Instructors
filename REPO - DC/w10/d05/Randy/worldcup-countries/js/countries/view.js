
var CountryDetailView = Backbone.View.extend({
  tagName: 'div',
  className: 'country-detail',

  template: _.template($('#country-detail').html()),

  events: {
    'change [name="playing"]': 'playing',
    'change [name="eliminated"]': 'eliminated',

  },

  playing: function(){
    this.model.set({isPlaying: !this.model.get("isPlaying")});
    this.render();
  },

  eliminated: function(){
    this.model.set({isEliminated: !this.model.get("isEliminated")});
    this.render();
  },

  render: function() {
    var rendered = this.template(this.model.toJSON());
    return this.$el.html(rendered);
  },

});
//////////////////////////////////////////////////////////////////////////////////////////////////////
var CountryListItemView = Backbone.View.extend({
  tagName: 'li',

  initialize: function() {
    this.listenTo(this.model, 'change', this.render);
    this.render();
  },

  render: function(){
    if (this.model.get('isPlaying') === true ){
      this.$el.toggleClass('playing')
    };
    if (this.model.get('isEliminated') === true){
      this.$el.toggleClass('eliminated')
    };

    var html = "<a href='#" + this.model.get('alpha2Code') + "'>" + this.model.get('name') + "</a>";
    this.$el.html(html);
  },
});
//////////////////////////////////////////////////////////////////////////////////////////////////////
var CountryListView = Backbone.View.extend({

  el: '#countries-list',

  initialize: function() {
    this.listenTo(this.collection, 'sync reset', this.render);
  },

  render: function() {
    var view = ''
    this.collection.each(function(country){
      view = new CountryListItemView({model: country});
      this.$el.append(view.$el);
    }, this);
  },
});

