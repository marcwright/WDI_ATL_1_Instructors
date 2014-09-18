// API: http://itsthisforthat.com/api.php?json
// PARAMS: {dataType: 'jsonp', jsonp: 'call'}

// sets up constructor function for creating instances of IdeaModel
var IdeaModel = Backbone.Model.extend({

  // sets default values for any given instance of IdeaModel
  defaults: {
    'this': 'Default THIS',
    'that': 'Default THAT'
  }

  // the 'url' attribute is used by the .fetch method to sync with an external API
  url: 'http://itsthisforthat.com/api.php?json',

  reload: function() {
    // fetch makes an ajax call to the address specified by the 'url' attribute.
    // We pass in 'jsonp' as the dataType to handle cross-origin request issues
    this.fetch({dataType: 'jsonp', jsonp: 'call'});
  }
});


// sets up constructor function for creating idea views
var IdeaView = Backbone.View.extend({
  // the DOM element to which the view attaches itself
  el: '#idea',

  // initialize is invoked by default when view is instantiated
  initialize: function() {
    // we tell the view to rerender anytime the its model emits a change event
    this.listenTo(this.model, 'change', this.render);
    this.render();
  },

  render: function(){
    var message = this.model.get('this') + '<span> for </span> ' + this.model.get('that');

    // finds any child <p> tags within the view's designated 'el' and sets their html
    this.$('p').html(message);
  },

  events: {
    'click #idea-reload': 'onReload'
  },

  onReload: function(evt) {
    this.model.reload();
  }
});



// when you instantiate a view, you'll almost always pass it a model or collection
// so that it has access to dynamic data
var ideaView = new IdeaView({ model: idea });
