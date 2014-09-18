var FluffyRouter = Backbone.Router.extend({

  routes: {
    'seal': 'update',
    'bunny': 'update',
    'panda': 'update',
    '*default': 'update'
  },

  update: function() {
    //FINDS ID FROM BROWSER OR DEFAULTS TO ID SEAL
    var id =  Backbone.history.fragment || 'seal' ;
    //HIDES ALL THEN SHOWS ONLY ONE WITH MATCHING ID
    $('.view').hide().filter('#' + id).show();
  },

  goToSeal: function() {
    $('.view').hide().filter('#seal').show();
  },

  goToBunny: function() {
      $('.view').hide().filter('#bunny').show();
  },

  goToPanda: function() {
      $('.view').hide().filter('#panda').show();
  }

});

var NavView = Backbone.View.extend({

  //LISTENS TO BROWSER ROUTES...
  initialize: function(options) {
    this.listenTo(options.router, 'route', this.render)
  },

  render: function() {
    //FIND AN A HREF CLASS
    $('a')
    //DEACTIVATE THEM ALL!
    .removeClass('active')
    //FILTER TO FIND ONLY A FRAGMENT THAT IS THE #NAME UP IN THE BROWSER ADDRESS BAR
    .filter('[href="#' + Backbone.history.fragment + '"]')
    //SET ITS CLASS TO ACTIVE-- TRIGGERING A STYLE
    .addClass('active');
  }

});

var fluffyRouter = new FluffyRouter();
var navView = new NavView({ router: fluffyRouter});

Backbone.history.start();
