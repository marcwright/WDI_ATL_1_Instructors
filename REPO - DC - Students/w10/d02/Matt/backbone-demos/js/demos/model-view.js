// API: http://itsthisforthat.com/api.php?json
// PARAMS: {dataType: 'jsonp', jsonp: 'call'}

var ideaModel = Backbone.Model.extend({

  url: 'http://itsthisforthat.com/api.php?json',

  defaults: {
    'this': '',
    'that': ''
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
    var message = this.model.get('this') + ' for ' + this.model.get('that');
    this.$('p').html(message);
  },

  events: {
    'click #idea-reload': 'onReload'
  },

  onReload: function(evt) {
    this.model.reload();
  }

});

var idea = new ideaModel();
var ideaView = new IdeaView({model: idea});

idea.reload();
