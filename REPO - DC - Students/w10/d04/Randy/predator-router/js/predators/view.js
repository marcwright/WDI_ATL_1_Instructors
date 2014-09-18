var PredatorListView = Backbone.View.extend({
  tagname: 'ul',
  className: 'predator-list',

  template: _.template($('#predator-list').html()),

  render: function(){

    var rendered = this.template({collection: this.collection});
    return this.$el.html(rendered);

  },
});


var PredatorDetailView = Backbone.View.extend({
  tagname: 'div',
  className: 'predator-detail',

  template: _.template($('#predator-detail').html()),

  render: function(){
    var rendered = this.template(this.model.toJSON());
    return this.$el.html(rendered);
  },
});


