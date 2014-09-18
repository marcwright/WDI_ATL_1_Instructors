/*
* @Author: stephenstanwood
* @Date:   2014-06-26 15:05:02
* @Last Modified by:   stephenstanwood
* @Last Modified time: 2014-06-27 11:51:15
*/

var StudentsRouter = Backbone.Router.extend({
  routes: {
    'students': 'list',
    'students/:id': 'detail',
    '*default': 'list'
  },

  clearView: function() {
    if ( this.view ) {
      this.view.remove();
    }
  },

  list: function() {
    this.clearView();
    this.view = new StudentListView({ collection: studentsCollection });
    this.view.render().appendTo( '#students-container' );
  },

  detail: function( id ) {
    this.clearView();
    this.view = new StudentDetailView({ model: studentsCollection.at( id - 1 )});
    this.view.render().appendTo( '#students-container' );
  }
});
