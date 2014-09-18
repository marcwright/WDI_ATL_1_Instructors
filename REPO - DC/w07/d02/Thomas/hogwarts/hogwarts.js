function Student(name, points) {
  this.name = name;
  this.points = points || 0;
}

Student.prototype = {
  awardPoints: function(awardPoints) {
    this.points += awardPoints;
  }
};


function House(name) {
  this.name = name;
  this.students = [];
}

House.prototype = {

  addStudent: function(studentName) {
    var newStudent = new Student(studentName);
    this.students.push(newStudent)
    return newStudent;
  },

  getStudent: function(name) {
    return _.findWhere(this.students, {name: name});
  },

  getOrCreateStudent: function(name) {
    return this.getStudent(name) || this.addStudent(name);
  },

  awardPointsTo: function(name, points) {
    student = this.getOrCreateStudent(name);
    student.awardPoints(points)
    return student
  },

  getTotalPoints: function() {
    var total = 0
    for (i = 0; i < this.students.length; i++) {
      total += student.points;
      return total
    }
  }

};


function School() {
  this.houses = [];
}

School.prototype = {

  addHouse: function(name) {
    var house = new House(name);
    this.houses.push(house)
    return house
  },

  addHouses: function() {
    for (i = 0; i < arguments.length; i++) {
      var house = new House(arguments[i]);
      this.houses.push(house)
    }
    return this.houses
  },

  getHouse: function(name) {
    return _.findWhere(this.houses, {name: name});
  },

  getLeadingHouses: function() {
    var leader = _.max(this.houses, function(house) {
      return house.getTotalPoints();
      debugger;
    });
    return leader
  }

};

var harry = new Student("Harry Potter");
harry.points = 10;
var gryffendor = new House("Gryffendor");
gryffendor.awardPointsTo("Ron", 10);
var hog = new School("Hogwarts");
hog.addHouse(gryffendor);
