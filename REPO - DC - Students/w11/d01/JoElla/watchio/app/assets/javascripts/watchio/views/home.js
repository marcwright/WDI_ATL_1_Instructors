define(function(require){

  var Backbone = require('backbone');
  var homeText = require('text!../templates/home.html');

  var HomeView = Backbone.View.extend({
    //building a constructor function so taht you can create homepage as needed, rather than having it and hiding it when not home
    tagName: 'div',

    render: function(){
      //return this to have jQuery to be able to chain other commands on
      return this.$el.html(homeText);
    }
  });
  return HomeView;
});
