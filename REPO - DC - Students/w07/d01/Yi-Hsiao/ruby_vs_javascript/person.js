function Person( name, hometown ) {
  this.name = name;
  this.hometown = hometown;
}

Person.prototype.sing = function () {
  console.log("Fa la la la.");
};

Person.prototype.introduce = function( visitorName ) {
  console.log( "Hi " + visitorName + ", my name is " + this.name + "." );
  console.log( "I'm from " + this.hometown + "." );
};