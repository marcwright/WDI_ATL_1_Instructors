function School() {
  this.houses = [];
}

School.prototype = {
  addHouse: function( name ) {
    var house = new House( name );
    this.houses.push( house );
  },
  addHouses: function() {
    for( var i = 0; i < arguments.length; i++ ) {
      this.addHouse( arguments[i] );
    }
  },
  getHouse: function( name ) {
    var house;
    for ( var i = 0; i < this.houses.length; i++ ) {
      house = this.houses[i];
      if ( house.name === name ) {
        return house;
      }
    }
    return null;
  },
  getLeadingHouse: function() {
    var leadingHouses = [];
    var maxScore = 0;

    var house;
    for ( var i = 0; i < this.houses.length; i++ ) {
      house = this.houses[i];
      score = house.getTotalPoints();

      if ( score > maxScore ) {
        leadingHouses = [house];
        maxScore = score;
      } else if ( house.getTotalPoints() === maxScore) {
        leadingHouses.push( house );
      }
    }

    return ( leadingHouses.length === 1 ) ? leadingHouses[0] : leadingHouses;
  }
};