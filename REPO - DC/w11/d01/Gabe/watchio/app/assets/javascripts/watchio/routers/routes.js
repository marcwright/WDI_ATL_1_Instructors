// * Create a router component that responds to "home" and "movies/:id" routes. Have all other routes default to the home behavior.

// * **When "home" triggers**: remove any existing main view, and then render a new HomeView into the document's "#main" element.

// * **When "movies/:id" triggers**: remove any existing main view. Then, create a new MovieDetail model for the route ID, render it with a MovieDetailView into the document's "#main" element, and then fetch the model.

// * Require the router into the main application module, and then start Backbone history.



define(function(require){

  var Backbone = require('backbone');
  var HomeView = require('../views/home');
  var DetailView = require('../views/home');

  var WatchioRouter = backbone.Router.extend({
    routes: {
      'default': 'homeShower'
      'home': 'homeShower'
      'movies/:id': 'detailShower'
    },

     homeShower: function(){

      // 1) REMOVE EXISTING VIEW SOMEHOW???
      this.$el.html.remove();

      //find element, then uses the render function from the Home.js View to render to the main# page element???
      var main = this.$('[class="main"]');
      render.main.html.(HomeView);
    },

     detailShower: function(){

      //????? what goes here?:
      //uses the detail.js view render function to attach the template to the #main element:

    }

  })

//Export a new instance of the router
  return new WatchioRouter();

});



 var source = $('#artist-list-template').html();
        var template = Handlebars.compile(source);
        var html = template(artists.toJSON());
        this.$el.html(html);
