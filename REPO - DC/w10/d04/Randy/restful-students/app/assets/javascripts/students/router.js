var StudentsRouter = Backbone.Router.extend({

  routes: {
    'students': 'list',
    'students/:id': 'detail',
    '*default': 'list'
  },

  clearView: function(){
    if (this.view){
      this.view.remove();
    }
  },

  list: function(){
    this.clearView();
    this.view = new StudentsListView({collection: studentsCollection});
    this.view.render().appendTo('#students-container');

  },

  detail: function(id){
    this.clearView();
    this.view = new StudentDetailView({model: studentsCollection.get(id)});
    this.view.render().appendTo('#students-container');
  }

});

var router = new StudentsRouter();
Backbone.history.start();
