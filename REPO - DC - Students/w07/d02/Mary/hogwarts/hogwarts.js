// STUDENT

function Student(name) {
  this.name = name;
  this.points = this.points || 0;
};

Student.prototype = {
  awardPoints: function(points) {
    return this.points = this.points + points;
  }
}

// HOUSE

function House(houseName) {
  this.name = houseName
  this.students = []
  this.totalPoints = this.getTotalPoints
}

House.prototype = {
  addStudent: function(name) {
    var newStudent = new Student(name);
    this.students.push(newStudent);
    return newStudent;
  },
  getStudent: function(name) {
    var matchStudent = _.find(this.students, function(student) {
      return student.name == name
    });
    return matchStudent || null;
  },
  getOrCreateStudent: function(name) {
    var matchStudent = _.find(this.students, function(student) {
      return student.name == name
    });
    return matchStudent || this.addStudent(name);
  },
  awardPointsTo: function(name,points) {
    return this.getOrCreateStudent(name).awardPoints(points);
  },
  getTotalPoints: function() {
    var arrayOfPoints = _.map(this.students, function(student) {
      return student.points
    });
    return _.reduce(arrayOfPoints, function(sum, points) {
      return sum + parseInt(points);
    }, 0);
  }
};

// SCHOOL

function School() {
  this.houses = []
}

School.prototype = {
  addHouse: function(name) {
    var newHouse = new House(name);
    this.houses.push(newHouse);
    return this;
  },
  addHouses: function(names) {
    for(var i=0; i<arguments.length; i++){
      arguments[i] = new House(arguments[i]);
      this.houses.push(arguments[i]);
    };
    return this;
  },
  getHouse: function(name) {
    var matchHouse = _.find(this.houses, function(house) {
      return house.name == name
    });
    return matchHouse || null;
  },
  getLeadingHouses: function() {
    return _.max(this.houses, function(house) {
      return parseInt(house.totalPoints() );
    });
  }
}

