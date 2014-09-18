// Add Item View:

var MuppetAddView = Backbone.View.extend({
  el: '#muppet-add',

  events: {
    'submit': 'onSubmit'
  },

  onSubmit: function(evt) {
    evt.preventDefault();

    var name = this.$('[name="name"]').val();
    var image = this.$('[name="image"]').val();
    var rating = this.$('[name="rating"]').val();

    this.collection.create({
      name: name,
      quantity: quantity
      rating: rating
    });

    this.$('input').val('');
  }
});


// Items List View:

var MuppetListView = Backbone.View.extend({
  el: '#muppet-list',

  initialize: function() {
    this.listenTo(this.collection, 'add remove', this.render);
    this.render();
  },

  render: function() {
    var html = this.collection.reduce(function(memo, model) {
      return memo + '<li>'+ model.get('name') +' ('+ model.get('image') +' ('+ model.get('rating') +') <button data-remove="'+ model.cid +'">X</button></li>';
    }, '');

    this.$el.html(html);
  },

  events: {
    'click [data-remove]': 'onRemove'
  },

  onRemove: function(evt) {
    var cid = this.$(evt.target).attr('data-remove');
    var model = this.collection.get(cid);
    model.destroy();
  }
});


// Fetch data, and then create views:

muppets.fetch().then(function() {
  var muppetAddView = new MuppetAddView({collection: muppets});
  var muppetListView = new MuppetListView({collection: muppets});
});