var MuppetAddView = Backbone.View.extend({

  el: '#muppet-add',

  events: {
    'submit' : 'onSubmit'
  },

  onSubmit: function(evt){
    evt.preventDefault();

    var name = this.$('[name="name"]').val();
    var image = this.$('[name="image"]').val();
    var rating = this.$('[name="rating"]').val();

    this.collection.create({
      name: name,
      image: image,
      rating: parseInt(rating)
    });

  }

});

var MuppetListView = Backbone.View.extend({

  el: '#muppet-list',

  initialize: function(){
    this.listenTo(this.collection, 'add remove change', this.render);
    this.render();
  },

  render: function(){
    var html = '';
    this.collection.sort();

    this.collection.each(function(model){
      html += '<li>' + model.get('rating') + " " + model.get('name')
        + '<img src="' + model.get('image') + '" ></img>'
        + '<button data-remove="'+ model.cid +'">X</button>'
        + '<button data-upvote="' + model.cid +'">Upboat</button>'
        + '<button data-downvote="' + model.cid + '">Downboat</button> </li>';
    });

    this.$el.html(html);
  },

  events: {
    'click [data-remove]': 'onRemove',
    'click [data-upvote]': 'onUpvote',
    'click [data-downvote]': 'onDownvote'
  },

  onRemove: function(evt){
    var cid = $(evt.target).attr('data-remove');
    var model = this.collection.get(cid);
    model.destroy();
  },

  onUpvote: function(evt){
    var cid = $(evt.target).attr('data-upvote');
    var model = this.collection.get(cid);
    model.upvote(1);
    this.render();
  },

  onDownvote: function(evt){
    var cid = $(evt.target).attr('data-downvote');
    var model = this.collection.get(cid);
    model.upvote(-1);
    this.render();
  }
});

muppets.fetch().then(function(){
  var muppetAddView = new MuppetAddView({collection: muppets});
  var muppetListView = new MuppetListView({collection: muppets});
});
