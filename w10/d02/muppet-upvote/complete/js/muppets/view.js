// Add Muppet View:

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
    this.$('input').val('');

    this.collection.create({
      name: name,
      image: image,
      rating: parseInt(rating)
    });
  }
});


// Muppets List Views:

var MuppetListView = Backbone.View.extend({
  el: '#muppet-list',

  initialize: function() {
    this.listenTo(this.collection, 'add remove sort', this.render);
    this.render();
  },

  render: function() {
    var html = this.collection.reduce(function(memo, model) {
      return memo
        + '<li><img src="'+ model.get('image') +'">'
        + model.get('name') +' ('+ model.get('rating') +') '
        + '<button data-up="'+ model.cid +'">UP</button>'
        + '<button data-down="'+ model.cid +'">DOWN</button>'
        + '<button data-remove="'+ model.cid +'">X</button></li>';
    }, '');

    this.$el.html(html);
  },

  events: {
    'click [data-remove]': 'onRemove',
    'click [data-up]': 'onUpVote',
    'click [data-down]': 'onDownVote'
  },

  onRemove: function(evt) {
    var cid = this.$(evt.target).attr('data-remove');
    var model = this.collection.get(cid);
    model.destroy();
  },

  onUpVote: function(evt) {
    var cid = this.$(evt.target).attr('data-up');
    var model = this.collection.get(cid);
    model.upvote(-1);
  },

  onDownVote: function(evt) {
    var cid = this.$(evt.target).attr('data-down');
    var model = this.collection.get(cid);
    model.upvote(1);
  }
});


muppets.fetch().then(function() {
  var muppetAddView = new MuppetAddView({collection: muppets});
  var muppetListView = new MuppetListView({collection: muppets});
});