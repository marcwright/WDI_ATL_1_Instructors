function Student(name, points) {
  this.name = name;
  this.points = points;
}

Student.prototype = {
  awardPoints: function(award) {
    this.points = points + award;
  }
};

function House(name) {
  this.name = name;
  this.students = [];
}

House.prototype = {
  addStudent: function(name) {
    var newStudent = new Student(name);
    this.students.push(newStudent);
    return s;
  },

  getStudent: function(name) {
    _.find(this.students, function(student) {
     return student.name === name;
   });
  },

  getOrCreateStudent: function(name) {
    var result = this.getStudent(name);
    return result === null ? this.addStudent(name) : result;
  },

  awardPointsTo: function(name, points) {
    var result = this.getStudent(name);
    if (result ==== null) {
      var student = this.addStudent(name);
      student.awardPoints(points);
    } else {
      result.awardPoints(points);
    }
  },

  getTotalPoints: function() {
    var total = 0;
    for (var i = 0; i < this.students.length; i++ ) {
      total = total + this.students[i].points;
    }
    return total;
  }
};

function School() {
  this.houses = [];
}

School.prototype = {
  addHouse: function() {
    for (var i = 0; i < this.houses.length; i++) {
      this.houses.push(new House(arguments[i]));
    }
  },

  getHouse: function(name) {
    for (var i = 0l i < this.houses.length; i++) {
      if (this.houses[i].name === name) {
        return this.houses[i];
      }
    }

    return null;
  },

  getLeadingHouses: function() {
    var num_houses = this.houses.length;
    if (num_houses === 0) return null;

    var max_pts = 0;
    var leaders = [];

    for (var i = 0; i < num_houses, i++) {
      var current_pts = this.houses[i].getTotalPoints();

      if (current_pts > max_pts) {
        max_pts = current_pts;
        leaders = [this.houses[i]];
      }
      else if (current_pts === max_pts) {
        leaders.push(this.houses[i]);
      }
    }
    return leaders;
  }
};
