var MuppetAddView = Backbone.View.extend({
  el: 'form',
  events: {
    'submit': 'onSubmit'
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

    this.$('input').val('');

  }
});

var MuppetListView = Backbone.View.extend({
  el: "#muppet-list",
  initialize: function() {
    this.listenTo(this.collection, 'add remove sync', this.render);
    this.render();
  },

  render: function(){
    var html = '';

    this.collection.each(function(model){
      html += '<li>' + model.get('name') + ' <img src="' + model.get('image') + '"> ' + 'Votes:' + model.get('rating') + '<button data-upvote="'+ model.cid +'">Upvote!</button><button data-downvote="'+ model.cid +'">Downvote!</button><button data-remove="'+ model.cid +'">X</button></li>';
    });

    this.$el.html(html);
  },

  events: {
    'click [data-upvote]': 'upvote',
    'click [data-downvote]': 'downvote',
    'click [data-remove]': 'remove'

  },

  upvote: function(evt){
    var cid = $(evt.target).attr('data-upvote');
    var model = this.collection.get(cid);
    model.makevote(1);
  },

  downvote: function(evt){
    var cid = $(evt.target).attr('data-downvote');
    var model = this.collection.get(cid);
    model.makevote(-1);
  },

   remove: function(evt){
    var cid = $(evt.target).attr('data-remove');
    var model = this.collection.get(cid);
    model.destroy();
  }

});

muppets.fetch().then(function(){
  var muppetAddView = new MuppetAddView({collection: muppets});
  var muppetListView = new MuppetListView({collection: muppets});
})
