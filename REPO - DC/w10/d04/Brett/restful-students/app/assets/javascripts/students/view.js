var StudentListView = Backbone.View.extend({
  tagName: "div",
  className: "students-list",

  initialize: function() {
    this.listenTo(this.collection, "sync", this.render);
  },

  template: _.template($("#students-list").html()),

  render: function() {
    var rendered = this.template({studentsCollection: this.collection});
    return this.$el.html(rendered);
  },

  events: {
    "submit form": "onSubmit"
  },

  onSubmit: function(event) {
    event.preventDefault();
    var name = this.$("[name='name']").val();
    this.collection.create({name: name});
    this.$("input").val("");
  }
});

var StudentDetailView = Backbone.View.extend({
  tagName: "div",
  className: "student-detail",

  template: _.template($("#student-detail").html()),

  render: function() {
    var rendered = this.template(this.model.toJSON());
    return this.$el.html(rendered);
  },

  done: function() {
    window.location.href = "#students"
  },

  events: {
    "click #done": "onDone",
    "click #remove": "onRemove",
    "click #save": "onSave"
  },

  onDone: function(event) {
    event.preventDefault();
    this.done();
  },

  onSave: function(event) {
    event.preventDefault();
    var data = this.$("input").serializeObject();
    this.model.save(data);
    this.done();
  },

  onRemove: function(event) {
    event.preventDefault();
    if(window.confirm("Are you sure you want to delete this student?")) {
      this.model.destroy();
      this.done();
    }
  }
});

