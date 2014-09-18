function Student(name, points) {
  this.name = name;
  this.points = points || 0;
}

Student.prototype = {

  awardPoints: function(points) {
    this.points = this.points + points;
  }
}; //Student


function House(name) {
  this.name = name;
  this.students = [];
}

House.prototype = {

  addStudent: function(name) {
    var student = new Student(name);
    this.students.push(name)
    return student;
  },

  getStudent: function(name) {
    return _.findWhere(this.students, {name: name});
  },

  getOrCreateStudent: function(name) {
    return this.getStudent(name) || this.addStudent(name);
  },

  awardPointsTo: function(name, points) {
    student = getOrCreateStudent(name);
    student.awardPoints(points);
    return student;
  },

  getTotalPoints: function() {
    return _.reduce(this.students, function(memo, student) {
    return memo + student.points;
    }, 0);
  }
} //House


var hogs = new House("Hogwarts");
var grif = new House("Grifindor");

var harry = new Student("Harry Potter");
var larry = grif.addStudent("Larry Sellers");

var findHarry = grif.getStudent("Harry Potter");
