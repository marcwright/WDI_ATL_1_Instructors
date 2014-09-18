var FluffyRouter = Backbone.Router.extend({

  routes: {
    'seal': 'update',
    'panda': 'update',
    'bunny': 'update',
    '*default': 'update'
  },

  update: function() {
    var id = Backbone.history.fragment || 'panda';
    $('.view').hide().filter('#'+id).show();
    this.navigate(id);
  }

});

var NavView = Backbone.View.extend({
  el: '#nav',

  initialize: function(options) {
    this.listenTo(options.router, 'route', this.render)
  },

  render: function() {
    this.$('a')
    .removeClass('active')
    .filter('[href="#' + Backbone.history.fragment + '"]')
    .addClass('active');
  }

});

var fluffyRouter = new FluffyRouter();
var navView = new NavView({router: fluffyRouter});

Backbone.history.start();
