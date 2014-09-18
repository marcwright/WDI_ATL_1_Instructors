function Student(name, points) {
  this.name = name;
  this.points = points || 0;
}

Student.prototype = {
  awardPoints: function(points) {
    return this.points += points;
  }
}

function House(name) {
  this.name = name;
  this.students = [];
}

House.prototype = {

  addStudent: function(name) {
    var student = new Student(name);
    this.students.push(student);
    return student;
  },

  getStudent: function(name) {
    return _.findWhere(this.students, {name: name})
  },

  getOrCreateStudent: function(name) {
    return this.getStudent(name) || this.addStudent(name);
  },

  awardPointsTo: function(name, points) {
    var student = this.getOrCreateStudent(name)
    student.awardPoints(points)
    return student
  },

  getTotalPoints: function() {
    return _.reduce(this.students, function(memo, student) {return memo + student.points;}, 0);
  }
}

function School(name) {
  this.name = name;
  this.houses = [];
}

School.prototype = {
  addHouse: function(name) {
    var house = new House(name);
    this.houses.push(house);
    return house;
  },

  addHouses: function() {
    for (var i = 0; i < arguments.length; i++) {
      var house = new House(arguments[i]);
      this.houses.push(house);
    }
    return this.houses;
  },

  getHouse: function(name) {
    return _.findWhere(this.houses, {name: name})
  },

  getLeadingHouses: function() {
    return _.max(this.houses, function(house){ return house.getTotalPoints(); });
  }
}
