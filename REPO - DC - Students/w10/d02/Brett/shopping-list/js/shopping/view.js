var ItemAddView = Backbone.View.extend({

  el: "#item-add",

  events: {
    "submit": "onSubmit"
  },

  onSubmit: function(event) {
    event.preventDefault();

    var name = this.$("[name='name']").val();
    var quantity = this.$("[name='quantity']").val();

    this.collection.create({
      name: name,
      quantity: parseInt(quantity)
    });

    this.$("input").val("");
  }
});

// A view to print out all list items:

var ItemListView = Backbone.View.extend({

  el: "#item-list",

  initialize: function() {
    this.listenTo(this.collection, "add remove sync", this.render);
    this.render();
  },

  render: function() {
    var html = "";

    this.collection.each(function(model) {
      html += "<li>" + model.get("name") + " (" + model.get("quantity") +") <button data-remove='"+ model.cid +"'>X</button></li>";
    });

    this.$el.html(html);
  },

  events: {
    "click button": "onButtonClick"
  },

  onButtonClick: function() {
    var cid = $(event.target).data("remove");
    var model = this.collection.get(cid);
    model.destroy();
  }

});

items.fetch().then(function(){
  var itemAddView = new ItemAddView({collection: items});
  var itemListView = new ItemListView({collection: items});
});
