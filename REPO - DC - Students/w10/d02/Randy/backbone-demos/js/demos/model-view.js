// API: http://itsthisforthat.com/api.php?json
// PARAMS: {dataType: 'jsonp', jsonp: 'call'}

  // Extend is similar to classical inheritance
var IdeaModel = Backbone.Model.extend({

  url: 'http://itsthisforthat.com/api.php?json',

  defaults: {
    'this': 'Chair',
    'that': 'Seel'
  },

  reload: function(){
    this.fetch({dataType: 'jsonp', jsonp: 'call'})
  }
});

// Create a new view
var IdeaView = Backbone.View.extend({
  // This view class will attach to an element in the DOM with the id of idea
  el: '#idea',

  initialize: function(){
    this.listenTo(this.model, 'change', this.render);
    this.render();
  },

  render: function(){
    var message = this.model.get('this') + ' for ' + this.model.get('that');
    this.$('p').html(message);
  },

  events: {
    'click #idea-reload': 'onReload'
  },

  onReload: function(){
    this.model.reload();
  }
});

// Create a new instance of out IdeaModel
var idea = new IdeaModel();

// Create a new instance of out IdeaView and attached it to the model we created before
var ideaView = new IdeaView({model: idea});

idea.reload();
