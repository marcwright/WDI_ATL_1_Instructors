console.log("router.js connected");

var Router = Backbone.Router.extend({
  routes: {
    'turtles'    : 'listTurtles',
    'turtles/:id' : 'displayDetail',
    '*default'    : 'listTurtles',
  },

  clearView: function(){
    if (this.view){
      this.view.remove();
      this.view = null;
    }
  },

  listTurtles: function(){
    console.log("listTurtles firing");
    this.clearView();
    this.view = new TurtleListView({ collection: turtleCollection });
    this.view.$el.appendTo(".content-wrapper");
  },

  displayDetail: function(id){
    this.clearView();
    var turtle = turtleCollection.find(function(turtle){
      return turtle.get("id") === parseInt(id);
    });
    this.view = new TurtleProfileView({ model: turtle });
    this.view.$el.appendTo(".content-wrapper");
  },

});
