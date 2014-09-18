function Student(name, points) {
  this.name = name;
  this.points = points || 0;
}

Student.prototype = {

  awardPoints: function(morepoints){
    return this.points = this.points + morepoints;
  },

  currentPoints: function(){
    return this.points;
  }

}

function House(housename) {
  this.housename = housename;
  this.students = [];
}

House.prototype = {

  addStudent: function(name) {
    var student = new Student(name);
    this.students.push(student);
    return student;
  },

  getStudent: function(studname) {
    var foundStudent = _.findWhere(this.students, {name: studname});
    return foundStudent;
  },

  getOrCreateStudent: function(name) {
    return this.getStudent(name) || this.addStudent(name);
  },

  awardPointsTo: function(name, points) {
    var student = this.getOrCreateStudent(name);
    student.awardPoints(points);
    return student;
  },

  getTotalPoints: function() {
    return _.reduce(this.students, function(memo, student) {return memo + student.points;}, 0);
  }

}

function School(schoolname){
  this.schoolname = schoolname;
  this.houses = [];
}

School.prototype = {

  addHouse: function(name) {
    var house = new House(name);
    this.houses.push(house);
    return house;
  },

  addHouses: function() {
    for(var i = 0; i <= arguments.length; i++) {
      var house = new House(arguments);
      this.houses.push(house);
      return house;
    }
  },

  getHouse: function(houseName) {
    var foundHouse = _.findWhere(this.houses, {name: houseName});
    return foundHouse;
  }

}


var bluehouse = new House("Blue House");
var redhouse = new House("Red House");

var ted = bluehouse.addStudent("Ted")
var ned = bluehouse.addStudent("Ned")

bluehouse.awardPointsTo("Ted", 10);
bluehouse.awardPointsTo("Ned", 20);

var georgetown = new School("Georgetown");
