function House( name ) {
  this.name = name;
  this.students = [];
}

House.prototype = {
  addStudent: function( name ) {
    var student = new Student( name );
    this.students.push( student );
    return student;
  },
  getStudent: function( name ) {
    for( var i = 0; i < this.students.length; i++ ) {
      if ( this.students[i].name === name ) {
        return this.students[i];
      }
    }
    return null;
  },
  getOrCreateStudent: function( name ) {
    return this.getStudent( name ) || this.addStudent( name );
  },
  awardPointsTo: function( name, points ) {
    this.getOrCreateStudent( name ).awardPoints( points );
  },
  getTotalPoints: function() {
    var sum = 0;
    for ( var i = 0; i < this.students.length; i++ ) {
      sum += this.students[i].points;
    }
    return sum;
  }
};