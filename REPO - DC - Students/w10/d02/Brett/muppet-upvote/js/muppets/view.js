var MuppetAddView = Backbone.View.extend({

  el: "#muppet-add",

  events: {
    "submit": "onSubmit"
  },

  onSubmit: function(event) {
    event.preventDefault();

    var name = this.$("[name='name']").val();
    var image = this.$("[name='image']").val();
    var rating = this.$("[name='rating']").val();

    this.collection.create({
      name: name,
      image: image,
      rating: parseInt(rating)
    });

    this.$("input").val("");
  }
});

var MuppetListView = Backbone.View.extend({

  el: "#muppet-list",

  initialize: function() {
    this.listenTo(this.collection, "add remove sync change:[rating]", this.render);
    this.render();
  },

  render: function() {

    this.collection.sort();
    var html = "";

    this.collection.each(function(model) {
      html += "<li>" + model.get("name") + "<img src='" + model.get("image") + "'> "+ model.get("rating") + "<button id='remove-muppet' data-remove='"+ model.cid +"'>X</button><button id='upvote-muppet' data-upvote='"+ model.cid +"'>UP</button><button id='downvote-muppet' data-downvote='"+ model.cid +"'>DOWN</button></li>";
    });

    this.$el.html(html);
  },

  events: {
    "click #remove-muppet": "removeMuppet",
    "click #upvote-muppet": "upvoteMuppet",
    "click #downvote-muppet": "downvoteMuppet"
  },

  removeMuppet: function() {
    var cid = $(event.target).data("remove");
    var model = this.collection.get(cid);
    model.destroy();
  },

  upvoteMuppet: function() {
    var cid = $(event.target).data("upvote");
    var model = this.collection.get(cid);
    model.upvote(1);
  },

  downvoteMuppet: function() {
    var cid = $(event.target).data("downvote");
    var model = this.collection.get(cid);
    model.upvote(-1);
  }

});

muppets.fetch().then(function() {
  var muppetAddView = new MuppetAddView({collection: muppets});
  var muppetListView = new MuppetListView({collection: muppets});
});
