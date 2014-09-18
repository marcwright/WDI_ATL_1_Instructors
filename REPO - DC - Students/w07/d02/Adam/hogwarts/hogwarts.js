function Student(name, points) {
  this.name = name;
  this.points = points || 0;
}

Student.prototype = {
  awardPoints: function(points) {
    this.points += points;
  }
} // End Student

function House(name) {
  this.name = name;
  this.students = [];
}

House.prototype = {

  addStudent: function(name) {
    var student = new Student(name);
    this.students.push(name);
    return student;
  },

  getStudent: function(name) {
    //var student = getStudent.find(name)
    return _.findWhere(this.students, {name: name});
  },



} // End House



// Seeds
var hogs = new House("Hogwarts");
var grifindor = new House("Grifindor");

var harry = new Student("Harry Potter");
//var harry = hogs.getStudent('Harry Potter');
//harry.awardPoints(10);
