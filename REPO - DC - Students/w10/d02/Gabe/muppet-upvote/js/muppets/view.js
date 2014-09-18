//EVERYTHING HAVING TO DO WITH ADDING A MUPPET TO THE VIEW
var MuppetAddView = Backbone.View.extend({

  //FINDS A FORM, WITH BUTTON INPUT AND DEFINES IT AS 'EL'
  el: 'form',

  //LISTENS FOR A 'SUBMIT' AND THEN KNOWS TO TRIGGER AN EVENT (CALLED onClick )...
  events: {
    'submit': 'onSubmit'
  },


  //WHAT TO DO WHEN IT HEARS A SUBMISSION, AS DEFINED ABOVE...
  onSubmit: function(evt) {
    evt.preventDefault();

    //FINDS THE ENTITIES WE'LL NEED, INSIDE THE DOM, AND DEFINES EACH
    var name = this.$('[name="name"]').val();
    var imageUrl = this.$('[name="image"]').val();
    var ratingNumber = this.$('[name="rating"]').val();

    //USES THESE DEFINITIONS TO CREATE A NEW MODEL INSIDE OF COLLECTION
    this.collection.create({
      name: name,
      image: imageUrl,
      rating: parseInt(ratingNumber)
    });

    //THEN WE EMPTY THE INPUT FIELDS
    this.$('input').val('');
  }
});


// LISTS THE MUPPETS FROM THE CURRENT COLLECTION IN THE VIEW...
var MuppetListView = Backbone.View.extend({

  //FINDS AN ELEMENT W/ ID MUPPET-LIST, AND SETS IT TO BE THE LIST 'EL'...
  el: '#muppet-list',

//UPON RUNNING MuppetListView, IT WILL:
  initialize: function() {
    //LISTEN TO THE COLLECTION, AND RENDER NEW ADDS OR REMOVES
    this.listenTo(this.collection, 'add remove sync', this.render);
    // ALSO, SIMPLY USE 'RENDER' TO SHOW THE ORIGINAL COLLECTION UPON INITIAL LOAD.
    this.render();
  },

  //DEFINES WHAT THE RENDER FUNCTION DOES:
  render: function() {

    var html = '';

    this.collection.each(function(model) {
       html += '<li>'+ 'name: ' + model.get('name') + '  Votes: ' + model.get('rating') + ' <img src="' + model.get('image') + '"> <button data-remove="' + model.cid + '">X</button><button data-up-vote="'+ model.cid +'">+</button><button data-down-vote="'+ model.cid +'">-</button></li>';

    });

    this.$el.html(html);
    this.collection.sort();

  },

  events: {
    'click [data-remove]': 'onRemove',
    'click [data-up-vote]': 'onUpVote',
    'click [data-down-vote]': 'onDownVote'
  },

  onRemove: function(evt) {
    var cid = $(evt.target).data('remove');
    var model = this.collection.get(cid);
    model.destroy();
  },

  onUpVote: function(evt) {
    var cid = $(evt.target).data('up-vote');
    var model = this.collection.get(cid);
    model.upVote(1);
  },


  onDownVote: function(evt) {
    var cid = $(evt.target).data('down-vote');
    var model = this.collection.get(cid);
    model.upVote(-1);
  }


});



muppets.fetch().then(function() {
  var muppetAddView = new MuppetAddView({collection: muppets});
  var muppetListView = new MuppetListView({collection: muppets});
});
