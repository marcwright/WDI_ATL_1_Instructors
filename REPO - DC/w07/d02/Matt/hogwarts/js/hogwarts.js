//// Hogwarts.js ////

// Student

function Student(name, points) {
  this.name = name;
  this.points = 0;
}

Student.prototype = {
  awardPoints: function(points) {
    this.points = this.points + points;
  }
}

// House

function House(houseName) {
  this.houseName = houseName;
  this.students = [];
}

House.prototype = {
  addStudent: function(student) {
    var student = new Student(student);
    this.students.push(student);
    return student;
  },
  getStudent: function(name) {
    return _.findWhere(this.students, {name: name});
  },
  getOrAddStudent: function(student) {
    return this.getStudent(student) || this.addStudent(student);
  },
  awardPointsTo: function(student, points) {
    this.getStudent(student).awardPoints(points);
  },
  getTotalPoints: function() {
    return _.reduce(this.students, function(memo, student){
        return memo + student.points;
      }, 0);
  }
}

// School

function School(schoolName) {
  this.schoolName = schoolName;
  this.fullSchool = [];
}

School.prototype = {
  addHouse: function(houseName) {
    var house = new House(house)
  }
}

//// Seeds

// create a house
var gryf = new House('Gryffindor');

// add student object to house students list
var harry = gryf.addStudent('Harry');
var ron = gryf.addStudent('Ron');

// get student
var getRon = gryf.getStudent('Ron');

// get or add student
var dumbo = gryf.getOrAddStudent('Dumbo');

// add points for harry
var pointAdd = gryf.awardPointsTo('Harry', 50);

// get gryf total points
var pointTotal = gryf.getTotalPoints();

