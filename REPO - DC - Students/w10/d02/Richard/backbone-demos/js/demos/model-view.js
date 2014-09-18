// API: http://itsthisforthat.com/api.php?json
// PARAMS: {dataType: 'jsonp', jsonp: 'call'}

//Backbone is the namespace for the objects
//Model will store data in the application
//.extend similar to classical inheritence in Rails
//Backbone.Model -> constructor for building instance of backbone model
// IdeaModel === function
var IdeaModel = Backbone.Model.extend({

  url: 'http://itsthisforthat.com/api.php?json',

  // attributes which the model stores - initial
  defaults: {
    'this': 'A set of reading glasses',
    'that': 'Inhak'
  },

  reload: function() {

    this.fetch({
    dataType: 'jsonp',
    jsonp: 'call'
    });
  }

});

var IdeaView = Backbone.View.extend({

  el: '#idea',

  initialize: function() {
    this.listenTo( this.model, 'change', this.render );
    this.render();
  },

  render: function() {
    var message = this.model.get( 'this' ) + ' for ' + this.model.get( 'that' );
    this.$( 'p' ).html(message);
  },

  events: {
    //'declare event declare event to watch': declare function to perform
    'click #idea-reload': 'onReload',
  },

  onReload: function(evt){
    console.log('Hey I was clicked!');
    this.model.reload();
  }
});

var idea = new IdeaModel();

//building the idea view, and binding to a model -> IdeaModel
//"look at idea model, when it does stuff, show it"
var ideaView = new IdeaView( { model: idea } );

idea.reload();
