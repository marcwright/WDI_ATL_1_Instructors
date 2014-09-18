// API: http://itsthisforthat.com/api.php?json
// PARAMS: {dataType: 'jsonp', jsonp: 'call'}
// Backbone is namespace for all objects and methods within Backbone; forget about prototypal inheritance; extend works like classical inheritance and returns constructor function for building some type of thing


var IdeaModel = Backbone.Model.extend({
  url: 'http://itsthisforthat.com/api.php?json',

  defaults: {
    'this': 'Chair',
    'that': 'dog'
  },

  reload: function() {
    this.fetch({dataType: 'jsonp', jsonp: 'call'})
  }
});

var IdeaView = Backbone.View.extend({
  el: '#idea',

  initialize: function() {
    this.listenTo(this.model, 'change', this.render);
    this.render();
  },

  render: function() {
    var message = this.model.get('this') + "<span> for </span>" + this.model.get('that')
    // Backbone makes jQuery variable for us for bound element
    // this.$() is an easier way to query locally within a specific area (within this)
    this.$('p').html(message)
    // this.$('span').css('color', 'purple')
  },

  // declarative event bindings:
  events: {
    'click #idea-reload': 'onReload'
  },

  onReload: function(evt) {
    this.model.reload();
  }
  //
});

var idea = new IdeaModel();
var ideaView = new IdeaView({model: idea});

idea.reload();
