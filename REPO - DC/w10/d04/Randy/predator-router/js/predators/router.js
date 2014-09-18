var PredatorsRouter = Backbone.Router.extend({

  routes: {
    'predators': 'list',
    'predators/:id': 'detail'
  },

  clearView: function(){
    if (this.view){
      this.view.remove();
    }
  },

  list: function(){
    this.clearView();
    this.view = new PredatorListView({collection: predatorsCollection});
    this.view.render().appendTo('#predators-container');

  },

  detail: function(id){
    this.clearView();
    this.view = new PredatorDetailView({model: predatorsCollection.get(id)});
    this.view.render().appendTo('#predators-container');

  }

});

var router = new PredatorsRouter();
Backbone.history.start();


// var detail = new PredatorDetailView({model: predatorsCollection.at(0)});
// detail.render().appendTo('#predator-container');

// var view = new PredatorListView({collection: predatorsCollection});
// view.render().appendTo('#predators-container');
