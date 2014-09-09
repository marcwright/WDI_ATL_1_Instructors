// A model for loading and managing idea data:

var IdeaModel = Backbone.Model.extend({
  url: 'http://itsthisforthat.com/api.php?json',

  defaults: {
    'this': 'Beachballs',
    'that': 'Puppy Dogs'
  },

  reload: function() {
    return this.fetch({dataType: 'jsonp', jsonp: 'call'});
  }
});


// A view for displaying loaded idea data:

var IdeaView = Backbone.View.extend({
  el: '#idea',

  initialize: function() {
    this.listenTo(this.model, 'change', this.render);
    this.render();
  },

  render: function() {
    this.$('#idea-text').html(this.model.get('this') +' for '+ this.model.get('that'));
  },

  events: {
    'click #idea-reload': 'onReload'
  },

  onReload: function(evt) {
    this.model.reload();
  }
});


var idea = new IdeaModel();
var ideaView = new IdeaView({model: idea});
