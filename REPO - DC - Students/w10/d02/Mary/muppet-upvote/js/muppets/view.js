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
      image: image,
      rating: parseInt(rating)
    });
    this.$('input').val('');
  }
});

var MuppetListView = Backbone.View.extend({
  el: '#muppet-list',

  initialize: function() {
    this.listenTo(this.collection, 'add destroy change', this.render);
    this.render();
  },

  render: function() {
    var html = '';
    this.collection.each(function(model) {
      html += '<li><img src="' + model.get('image') + '">' + model.get('name') + ' (' + model.get('rating') + ')<button id="upvote" data-upvote="' + model.cid + '">Upvote</button> <button id="downvote" data-downvote="' + model.cid + '">Downvote</button><button data-remove="' + model.cid + '">X</button></li>';
    });
    this.$el.html(html);
    this.collection.sortByRating('rating');
  },

  events: {
    'click [data-remove]': 'onRemove',
    'click #upvote': 'upvote',
    'click #downvote': 'downvote'
  },

  upvote: function(evt) {
    var cid = $(evt.target).data('upvote');
    var model = this.collection.get(cid);
    model.vote(-1);
    this.render();
  },

  downvote: function(evt) {
    var cid = $(evt.target).data('downvote');
    var model = this.collection.get(cid);
    model.vote(1);
    this.render();
  },

  onRemove: function(evt) {
    var cid = $(evt.target).data('remove');
    var model = this.collection.get(cid);
    model.destroy();
  }
});


muppets.fetch().then(function() {
  var muppetAddView = new MuppetAddView({collection: muppets});
  var muppetListView = new MuppetListView({collection: muppets});
});
