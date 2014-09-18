// Create a "muppet-add" view which binds the HTML form to the muppets collection. 
// Bind a "submit" event handler that passes form input into the collection.

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
    this.listenTo(this.collection, 'add remove', this.render);
    this.render();
  },
  render: function() {
    var html = '';
    this.collection.each(function(model) {
      html += '<li>' + model.get('name') + 
      '<img src="' + model.get('image') + '"><button data-upvote="' + model.cid + '">Upvote</button><button data-downvote="' + model.cid + '">Downvote</button><button data-remove="'+ model.cid + '">X</button>Rating: ' + model.get('rating') + '</li>';
    });
    this.$el.html(html);
  },
  events: {
    'click [data-remove]': 'onRemove',
    //event upvote
    'click [data-upvote]': 'onUpvote',
    //event downvote
    'click [data-downvote]': 'onDownvote'
  },
  onRemove: function(evt) {
    var cid = $(evt.target).data('remove');
    var model = this.collection.get(cid);
    model.destroy();
  },
  onUpvote: function(evt) {
    var cid = $(evt.target).data('upvote');
    var model = this.collection.get(cid);
    model.upvote(1);
  },
  onDownvote: function(evt) {
    var cid = $(evt.target).data('downvote');
    var model = this.collection.get(cid);
    model.upvote(-1);
  }
});

muppets.fetch().then(function() {
  var muppetAddView = new MuppetAddView({collection: muppets});
  var muppetListView = new MuppetListView({collection: muppets});  
});
