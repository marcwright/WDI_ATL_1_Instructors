/*
* @Author: stephenstanwood
* @Date:   2014-06-24 10:26:29
* @Last Modified by:   stephenstanwood
* @Last Modified time: 2014-06-24 13:47:20
*/

// API: http://itsthisforthat.com/api.php?json
// PARAMS: {dataType: 'jsonp', jsonp: 'call'}

var IdeaModel = Backbone.Model.extend({
  url: 'http://itsthisforthat.com/api.php?json',

  defaults: {
    'this': 'chair',
    'that': 'dog'
  },

  reload: function() {
    this.fetch( { dataType: 'jsonp', jsonp: 'call' } );
  }
});

// idea.on( 'change', function() {
//   console.log( 'this model changed' );
// });

var IdeaView = Backbone.View.extend({

  // attach to <div id="idea"> in the DOM
  el: '#idea',

  initialize: function() {
    this.listenTo( this.model, 'change', this.render );
    this.render();
  },

  render: function() {
    var message = this.model.get( 'this' ) + ' <span>for</span> ' + this.model.get( 'that' );
    this.$( 'p' ).html( message );

    this.$( 'span' ).css( 'color', 'white' );
  },

  events: {
    'click #idea-reload': 'onReload'
  },

  onReload: function( e ) {
    this.model.reload();
  }

});

var idea = new IdeaModel();
var ideaView = new IdeaView( { model: idea } );

idea.reload();
