/*
* @Author: stephenstanwood
* @Date:   2014-06-26 12:05:36
* @Last Modified by:   stephenstanwood
* @Last Modified time: 2014-06-26 14:43:18
*/

var PredatorsRouter = Backbone.Router.extend({
  routes: {
    'predators': 'list',
    'predators/:id': 'detail'
    // ,'*default': 'list'
  },

  clearView: function() {
    if ( this.view ) {
      this.view.remove();
    }
  },

  list: function() {
    this.clearView();
    this.view = new PredatorListView({ collection: predatorsCollection });
    this.view.render().appendTo( '#predator-container' );
  },

  detail: function( id ) {
    this.clearView();
    this.view = new PredatorDetailView({ model: predatorsCollection.at( id - 1 )});
    this.view.render().appendTo( '#predator-container');
  }
});

var router = new PredatorsRouter();
Backbone.history.start();
