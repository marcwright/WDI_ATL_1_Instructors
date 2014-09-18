var PredatorListView = Backbone.View.extend({
  tagName: 'ul',
  className: 'predator-list',
  template: _.template($('#predator-list').html()),

  render: function() {
    var rendered = this.template({predators: this.collection});
    return this.$el.html(rendered);
  }
});


var PredatorDetailView = Backbone.View.extend({
  tagName: 'div',
  className: 'predator-detail',
  template: _.template($('#predator-detail').html()),

  render: function() {
    var rendered = this.template(this.model.toJSON());
    return this.$el.html(rendered);
  }
});