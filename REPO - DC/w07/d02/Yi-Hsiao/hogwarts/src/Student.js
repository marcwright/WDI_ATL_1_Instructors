function Student( name ) {
  this.name = name;
  this.points = 0;
}

Student.prototype.awardPoints = function( awardedPoints ) {
  this.points += awardedPoints;
};