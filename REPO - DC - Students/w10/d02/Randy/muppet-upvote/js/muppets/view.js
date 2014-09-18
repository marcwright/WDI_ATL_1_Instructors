///////////////////////////////////////////////////////////////////////////////////////////////
var MuppetAdd = Backbone.View.extend({
  el: '#muppet-add',

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
  },
});
///////////////////////////////////////////////////////////////////////////////////////////////
var MuppetsList = Backbone.View.extend({
  el: '#muppet-list',

  events: {
    'click [data-remove]': 'onRemove',
    'click [data-upvote]': 'onUpVote',
    'click [data-downvote]': 'onDownVote'
  },


  initialize: function(){
    this.listenTo(this.collection, 'add remove change', this.render);
    this.render();
  },

  render: function(){
    this.collection.sort();

    var html = '';
    this.collection.each(function(model){
      html += "<li>" + "<img src='" + model.get('image') + "'> " + model.get('name') + "  (" + model.get('rating') + ")<button data-upvote='" + model.cid + "'>UpVote</button>" + "<button data-remove='" + model.cid + "'>:(</button>" + "<button data-downvote='" + model.cid + "'>DownVote</button> </li>"
    });
    this.$el.html(html)
  },

  onRemove: function(evt){
    var cid = $(evt.target).attr('data-remove');
    var model = this.collection.get(cid);
    model.destroy();
    this.render();
  },

  onUpVote: function(evt){
    var cid = $(evt.target).attr('data-upvote');
    var model = this.collection.get(cid);
    model.upvote(1);
    this.render();
  },

  onDownVote: function(evt){
    var cid = $(evt.target).attr('data-downvote');
    var model = this.collection.get(cid);
    model.upvote(-1);
    this.render();
  }

});
///////////////////////////////////////////////////////////////////////////////////////////////

muppetCollection.fetch().then(function(){
var muppetAdd = new MuppetAdd({collection: muppetCollection});
var muppetList = new MuppetsList({collection: muppetCollection});
});
