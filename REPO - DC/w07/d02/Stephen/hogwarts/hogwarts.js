/*
* @Author: stephenstanwood
* @Date:   2014-06-03 18:37:56
* @Last Modified by:   stephenstanwood
* @Last Modified time: 2014-06-03 19:44:50
*/

function Student( name, points ) {
  this.name = name;
  this.points = 0;
}

Student.prototype = {
  awardPoints: function( points ) { this.points += points }
}

function House( name ) {
  this.name = name;
  this.students = [];
}

House.prototype = {
  addStudent: function( name ) {
    var s = new Student( name );
    this.students.push( s )
    return s;
  },

  getStudent: function( name ) {
    for ( var i = 0; i < this.students.length; i++ ) {
      if ( this.students[i].name === name ) {
        return this.students[i];
      }
    }

    return null;
  },

  getOrCreateStudent: function( name ) {
    var res = this.getStudent( name );
    return res === null ? this.addStudent( name ) : res;
  },

  awardPointsTo: function( name, points ) {
    var res = this.getStudent( name );
    if ( res === null ) {
      var s = this.addStudent( name );
      s.awardPoints( points );
    } else {
      res.awardPoints( points );
    }
  },

  getTotalPoints: function() {
    var total = 0;
    for ( var i = 0; i < this.students.length; i++ ) {
      total += this.students[i].points;
    }

    return total;
  }
}

function School() {
  this.houses = [];
}

School.prototype = {
  addHouse: function() {
    for ( var i = 0; i < arguments.length; i++ ) {
      this.houses.push( new House( arguments[i] ) );
    }
  },

  getHouse: function( name ) {
    for ( var i = 0; i < this.houses.length; i++ ) {
      if ( this.houses[i].name === name ) {
        return this.houses[i];
      }
    }

    return null;
  },

  getLeadingHouses: function() {
    var num = this.houses.length;
    if ( num === 0 ) return null;

    // track the leading number of points and all leaders
    var max = 0;
    var leaders = [];

    // loop until there are no more houses
    for ( var i = 0; i < num; i++) {
      var curr = this.houses[i].getTotalPoints();

      // if this is the new leader, wipe out any old ones & set new max
      if ( curr > max ) {
        max = curr;
        leaders = [ this.houses[i] ];
      }
      // if this house has the same number of points, add it to leaders
      else if ( curr === max ) {
        leaders.push( this.houses[i] );
      }
    }

    return leaders;
  }
}

// including sample usage code below for testing
var hogwarts = new School();
hogwarts.addHouse('Gryffindor');
hogwarts.addHouse('Ravenclaw', 'Hufflepuff','Slytherin');

var ravenclaw = hogwarts.getHouse('Ravenclaw');
var gryff = hogwarts.getHouse('Gryffindor');

gryff.addStudent('Harry Potter');
gryff.awardPointsTo('Hermionie Granger', 20);

var harry = gryff.getStudent('Harry Potter');
harry.awardPoints(10);

ravenclaw.awardPointsTo('Stephen', 30);

var total = gryff.getTotalPoints();
var leaders = hogwarts.getLeadingHouses();
