// ## Favorite Things

// Create an array that contains a few of your favorite things (fruits, vegetables, colors, sports teams, whatever). Write some code in JavaScript that outputs strings like (for an array of arbitrary length):

// ```
// My #1 favorite baseball team is the New York Mets.
// My #2 favorite baseball team is the San Francisco Giants.
// ```

// ##### Bonus

// Change the output to:
// ```
// My 1st favorite baseball team is the New York Mets.
// My 2nd favorite baseball team is the San Francisco Giants.
// ```

function favoriteThings( things ) {
  this.things = things;
}

favoriteThings.prototype.printFavorites = function() {
  for ( var categoryType in this.things ) {
    for ( var item in this.things[categoryType] ) {
      favoriteThing = this.things[categoryType][item];
      nthItem = parseInt( item ) + 1;

      console.log( "My #" + nthItem + " favorite " + categoryType + " is the " + favoriteThing + "." );
    }
  }
};

var myFavoriteThings = new favoriteThings({
  team: ["New York Mets", "San Francisco Giants"]
});

myFavoriteThings.printFavorites();