// API: http://itsthisforthat.com/api.php?json
// PARAMS: {dataType: 'jsonp', jsonp: 'call'}

var IdeaModel = Backbone.Model.extend({
  url: 'http://itsthisforthat.com/api.php?json',

  defaults: {
    'this': 'Bracelet',
    'that': 'Nalgene Bottles'
  },

  reload: function() {
    this.fetch({dataType: 'jsonp', jsonp: 'call'});
    }

});

var IdeaView = Backbone.View.extend({

  el: '#idea',

  initialize: function() {
    this.listenTo(this.model, 'change', this.render);
    this.render();
  },

  render: function() {
    this.$el.html(this.model.get('this') + ' for ' + this.model.get('that'));
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

idea.reload();
