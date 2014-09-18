/*
* @Author: stephenstanwood
* @Date:   2014-06-26 09:55:35
* @Last Modified by:   stephenstanwood
* @Last Modified time: 2014-06-26 11:52:51
*/

var FluffyRouter = Backbone.Router.extend({
  // handles changes inside of URL bar
  routes: {
    'seal': 'update',
    'panda': 'update',
    'bunny': 'update',
    '*default': 'update'
  },

  update: function() {
    var id = Backbone.history.fragment || 'seal';
    $( '.view' ).hide().filter( '#' + id ).show();
    this.navigate( id );
  }
});

var NavView = Backbone.View.extend({
  el: '#nav',

  initialize: function( options ) {
    this.listenTo( options.router, 'route', this.render );
  },

  render: function() {
    $( 'a' )
      .removeClass( 'active' )
      .filter( '[href="#"' + Backbone.history.fragment  + ']' )
      .addClass( 'active' );
  }
});

var router = new FluffyRouter();
var navView = new NavView({ router: router });
Backbone.history.start();
