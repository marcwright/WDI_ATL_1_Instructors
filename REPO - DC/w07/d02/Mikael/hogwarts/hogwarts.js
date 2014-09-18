function Student(name, points) {
  this.name = name;
  this.points = points || 0;
}

Student.prototype = {
  awardPoints: function(points) {
    return this.points = this.points + points;
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
    for (var i = 0; i < this.students.length; i++) {
      if (this.students[i].name === name) {
        return this.students[i];
      }
    }
  },
  getOrCreateStudent: function(name) {
    return this.getStudent(name) || this.addStudent(name);
  },
  awardPointsTo: function(name, points) {
    var stud = this.getOrCreateStudent(name);
    return stud.points = stud.points + points;
  },
  getTotalPoints: function() {
    var sum = 0;
    for (var i = 0; i < this.students.length; i++) {
      sum = sum + this.students[i].points;
    }
    return sum;
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
      this.houses.push(this.addHouse(arguments[i]));
    }
  },
  getHouse: function(name) {
    for (var i = 0; i < this.houses.length; i++) {
      if (this.houses[i].name === name) {
        return this.houses[i];
      }
    }
  },
  getLeadingHouses: function() {
    var puntos = [];
    for (var i = 0; i < this.houses.length; i++) {
      puntos.push(this.houses[i].points);
    }
    return getMaxOfArray(puntos);
  }
}

var harry = new Student('Harry', 100);
var gryff = new House('Gryffindor');
gryff.addStudent('hermione');
gryff.awardPointsTo('hermione', 100);
gryff.addStudent('Ron');
gryff.awardPointsTo('Ron', 40);
console.log(gryff.getTotalPoints());

var hogwarts = new School('Hogwarts');

hogwarts.addHouse('Gryffindor');
hogwarts.addHouses('Slytherin', 'Hufflepuff', 'Ravenclaw');
console.log(hogwarts.getHouse('Hufflepuff'));

hogwarts.getHouse('Slytherin').addStudent('Draco Malfoy');
hogwarts.getHouse('Slytherin').addStudent('Parvati Patil');
hogwarts.getHouse('Slytherin').awardPointsTo('Draco Malfoy', 200);
console.log(hogwarts.getLeadingHouses());
