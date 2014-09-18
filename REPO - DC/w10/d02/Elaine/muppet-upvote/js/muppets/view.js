
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
    this.listenTo(this.collection, 'add remove change', this.render);
    this.render();
  },

  render: function() {
    var html = '';

    this.collection.sort();

    this.collection.each(function(model) {
      html += '<li><img src="' + model.get('image') + '" height="50" >' + model.get('name') + ' (' + model.get('rating') + ') <button data-upvote="' + model.cid + '">UP</button><button data-downvote="' + model.cid + '">DOWN</button><button data-remove="' + model.cid + '">X</button></li>';
    });

    this.$el.html(html);
  },

  events: {
    'click [data-upvote]': 'onUpvote',
    'click [data-downvote]': 'onDownvote',
    'click [data-remove]': 'onRemove'
  },

  onRemove: function(evt) {
    var cid = $(evt.target).data('remove');
    model = this.collection.get(cid);
    model.destroy();
  },

  onUpvote: function(evt) {
    var cid = $(evt.target).data('upvote');
    model = this.collection.get(cid);
    model.changeVote(1);
  },

  onDownvote: function(evt) {
    var cid = $(evt.target).data('downvote');
    model = this.collection.get(cid);
    model.changeVote(-1);
  }
});

muppets.fetch().then(function() {
  var muppetAddView = new MuppetAddView({collection: muppets});
  var muppetListView = new MuppetListView({collection: muppets});
});
