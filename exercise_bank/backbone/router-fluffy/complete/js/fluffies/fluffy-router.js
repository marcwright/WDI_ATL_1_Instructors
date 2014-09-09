var FluffyRouter = Backbone.Router.extend({
  routes: {
    'seal': 'update',
    'panda': 'update',
    'bunny': 'update',
    '*default': 'update'
  },

  update: function() {
    var id = Backbone.history.fragment || 'seal';
    $('.view').hide().filter('#'+id).show();
    this.navigate(id);
  }
});


var NavView = Backbone.View.extend({
  el: '#nav',

  initialize: function(options) {
    this.listenTo(options.router, 'route', this.render);
    this.render();
  },

  render: function() {
    this.$('a')
      .removeClass('active')
      .filter('[href="#'+ Backbone.history.fragment +'"]')
      .addClass('active');
  }
});


var router = new FluffyRouter();
var nav = new NavView({router: router});

Backbone.history.start();