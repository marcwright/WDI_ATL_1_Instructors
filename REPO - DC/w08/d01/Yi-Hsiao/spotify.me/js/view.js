function View() {
  this.api = new SpotifyAPI();
  this.initialize();
}

View.prototype = {
  initialize: function() {
    var $form = $( "#search" );
    var $searchType = $( "#search-type" );
    var view = this;

    // make an api request on form submission
    $form.on( "submit", function( evt ) {
      evt.preventDefault();
      view.querySpotify();
    });

    // make an api request when changing the search type
    $searchType.on( "change", function() {
      view.querySpotify();
    });
  },
  querySpotify: function() {
    var searchType = $( "#search-type" ).val();
    var query = $( "#search" ).serialize();
    this.api.getData( searchType, query, this.buildList, this );
  },
  buildList: function( type, response ) {
    // data is located in the plural form of the data type
    // e.g. albums, artists, tracks
    var data = response[type + "s"];

    var html = "<ul>";
    for ( var i = 0; i < data.length; i ++ ) {
      html += "<li>" + data[i].name + "</li>";
    }
    html += "</ul>";

    $( "#results" ).html( html );
  }
};

$(function() {
  new View();
});