
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
    this.listenTo(this.collection, 'add sync remove sort', this.render);
    this.render();
  },

  render: function() {
    var html = '';
     this.collection.each(function(model) {
      html += '<li>'
        + model.get('name') + '<img src="'+ model.get('image')+ '">' + ' ('+ model.get('rating') +') '
        +'<button data-upvote="'+ model.cid +'">up</button>'
        +'<button data-downvote="'+ model.cid +'">down</button>'
        +'<button data-remove="'+ model.cid +'">delete</button></li>';
    });

    this.$el.html(html);
  },

  events: {
    'click [data-remove]': 'onRemove',
    'click [data-upvote]': 'upVote',
    'click [data-downvote]': 'downVote'
  },

  //how does 'target' work in the below?
  onRemove: function(evt) {
    var cid = $(evt.target).data('remove');
    var model = this.collection.get(cid);
    model.destroy();
  },

  upVote: function(evt) {
    var cid = $(evt.target).data('upvote');
    var model = this.collection.get(cid);
    model.vote(-1);
  },

  downVote: function(evt) {
    var cid = $(evt.target).data('downvote');
    var model = this.collection.get(cid);
    model.vote(1);
  }

});

muppets.fetch().then(function() {
  var muppetAddView = new MuppetAddView({collection: muppets});
  var muppetListView = new MuppetListView({collection: muppets});
});
