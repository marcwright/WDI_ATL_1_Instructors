//construcotr function
var FluffyRouter = Backbone.Router.extend({
  //triggers from the URL
  routes: {
    'seal': 'update',
    'panda': 'update',
    'bunny': 'update',
    '*default': 'update'
  },

  update: function(){
    //the fragment is the section of the page, #seal or whatever
    var id = Backbone.history.fragment || 'seal';
    $('.view').hide().filter('#'+id).show();
    this.navigate(id);
  }
});

//job is to listen to route for route events (when the route changes), then this calls re-rendering of the view
var NavView = Backbone.View.extend({
  initialize: function(options){
    this.listenTo(options.router, 'route', this.render);
  },

  render: function(){
    $('a')
      .removeClass('active')
      .filter('[href="#'+Backbone.history.fragment+'"]')
      .addClass('active');
  }

});

//create an instance of the FluffyRouter to work with
var router = new FluffyRouter();
var navView = new NavView({router: router});
//bc you need to listen to what the URL is doing, and you've set up some functions to track it above
Backbone.history.start();
