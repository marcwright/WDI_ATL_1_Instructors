console.log("list_view.js connected");

var TurtleListView = Backbone.View.extend({
  // this is a list view, so our el will be an unordered list
  tagName: 'ul',

  // grab the template specified in the spec
  template: _.template( $("#turtle-list-item-template").html() ),

  initialize: function(){
    // we listen to the collection so that if anything fetches, we rerender the page
    this.listenTo(this.collection, 'sync add remove', this.render);
    this.render();
  },

  render: function(){
    var html = this.template({ collection: this.collection });
    return this.$el.html(html);
  },
});

