// * Create a Search view that binds to the document's "#search" element. Export a instance of SearchView, with the Search collection attached. SearchView should submit new search terms, and rerender whenever new search data syncs.
define(function(require){
  //what this view requires:
  var Backbone = require('backbone');
  var search = require('../models/search');

  var SearchView = Backbone.View.extend({
   el:'#search',

   initialize: function(){
    //runs 'render' when the collection changes,
    this.listenTo(this.collection, 'sync', this.render);
    //Also runs 'render' the first time we initialize this function
    this.render
   },

   render: function() {
    // build search results display...


    var resultData = '';

    //now, iterate through the populated model,and put the data out into my result data array
    this.collection.each(function(model){
      resultData +=  '<option value="' + model.get('Title') + '">' + model.get('Title') + '</option>"';
    });
    //put the full data array into the html of the selected element
    this.$('[name="search-results"]').html(resultData);

   },

   //which dom events do you want to define behavior for?
   events: {
    'submit': 'onSubmit',
    'change [name="search-results"]': 'updateURL'
   },

   onSubmit: function(evt) {
    evt.preventDefault();
    var input = this.$('[name="search"]');
    var inputValue = input.val();
    this.collection.search(inputValue);
    input.val("");
   },

   updateURL: function(evt) {
    evt.preventDefault();
    var newUrl = this.$('[name="search-results"]').val();
    window.location.hash = newUrl;
    console.log("currently displaying:" + window.location);

   }

  });


  //Export a new instance of SearchView
  return new SearchView({collection: search});
});
