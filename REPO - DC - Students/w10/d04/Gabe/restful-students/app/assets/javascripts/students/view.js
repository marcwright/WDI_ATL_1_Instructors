//CREATES A STUDENT COLLECTION
var StudentListView = Backbone.View.extend({

  //DEFINE some of the basic characteristics of this collection, and the functions they call:
  className: 'students-list',
  template: _.template($('#students-list').html()),
  events: {
    "submit form": "onSubmit"
  },

  //A function which runs on initialize, and always listens:
  intialize: function(){
    // listens to the collection
    this.listenTo(this.model, 'change', this.render);
    this.listenTo(this.model, 'destroy', this.remove);
    // when it changes, re-renders the view (itself)
    this.render();
  },


  onSubmit: function(evt) {

    //first, prevent a default page refresh:
    evt.preventDefault();

    // find whatever is in the form field -- it has name of name
    var studentname = this.$('[name="name"]').val();

    // collection.create(info taken out of form)
    studentsCollection.create({name: studentname});

    //then, reset the submit field  THIS IS BUSTED!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    // collection.reset(filtered);
     // el.reset();



  },

  render: function() {
    var rendered = this.template({collection: studentsCollection });
    return this.$el.html(rendered);
  }
});

//CREATES A STUDENT DETAIL VIEW FOR ONE STUDENT
var StudentDetailView = Backbone.View.extend({
  tagName: 'form',
  className: 'student-detail',
  template: _.template($('#student-detail').html()),

  render: function() {
    var rendered = this.template({collection: studentsCollection });
    return this.$el.html(rendered);
  }
});

var studentListView = new StudentListView({collection: studentsCollection});
//IF I RENDER THIS TO DOM, IT WILL BE SHOWING UP TWICE. ITS ALREADY GOING TO BE RENDERED INTO A DIV, WHICH THE CONSTRUCTOR MAKES BY DEFAULT.
// studentListView.render().appendTo('body');

//THIS PART CURRENTLY SHOWS ALL THE TIME-- IT SHOULD ONLY SHOW WHEN I CLICK ON A STUDENTS NAME (AND THUS GET THEIR ID) FROM THE STUDENTS COLLECTION.
var studentDetailView = new StudentDetailView({collection: studentsCollection});
// studentDetailView.render().appendTo('body');
