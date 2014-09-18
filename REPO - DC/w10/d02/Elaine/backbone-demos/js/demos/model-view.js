// API: http://itsthisforthat.com/api.php?json
// PARAMS: {dataType: 'jsonp', jsonp: 'call'}

var IdeaModel = Backbone.Model.extend({

  url: 'http://itsthisforthat.com/api.php?json',
  defaults: {
    'this': 'chairs',
    'that': 'dog'
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
    this.$('p').html(this.model.get('this') + ' <span>for</span> ' + this.model.get('that'));

    this.$('span').css('color', 'red');
  },

  events: {
    'click #idea-reload': 'onReload'
  },

  onReload: function(evt) {
    // console.log('Hey I was clicked');
    this.model.reload();
  },
});

var idea = new IdeaModel();
var ideaView = new IdeaView({model: idea});


idea.reload();
