// Constructor for the School Object
function School(name) {
  this.name = name;
  this.houses = [];
}
  // Prototype for School Object
  School.prototype = {
    //function to add house
    addHouse: function(name) {
      this.houses.push(new House(name));
    },

    addHouses: function() {
      for (var i = 0; i<arguments.length; i++) {
        this.houses.push(new House(arguments[i]));
      }
    },

    getHouse: function(name) {
      var match = _.findWhere(this.houses, {name: name});
      return match;
    },

    getLeadingHouse: function() {
      return _.max(this.houses, function(house) {return house.getTotalPoints();});
    }
  }


function House(name) {
  this.name = name;
  this.students = [];
}

  House.prototype = {
    addStudent: function(student) {
      this.students.push(new Student(student));
    },

    getStudent: function(student) {
      var match = _.findWhere(this.students, {name: student});
      return match;
    },

    getOrCreateStudent: function(student) {
     this.getStudent(student) || this.addStudent(student);
    },

    awardPointsTo: function(student, points) {
      this.getStudent(student).awardPoints(points);
    },

    getTotalPoints: function() {
      return _.reduce(this.students, function(memo, student) {return memo + student.points;}, 0);
  }

  }


function Student(name) {
  this.name = name;
  this.points = 0;
}

  Student.prototype = {
    awardPoints: function(points) {
      this.points = this.points + points;
    }
  }

var harry = new Student("Harry Potter");
var herm = new Student("Hermione Granger");
var inhak = new Student("Inhak Kim");
var randy = new Student("Randy Latz");
var richard = new Student("Richard Hessler");
var yiHsiao = new Student("Yi-Hsiao Liu");

// var gryff = new House("Gryffindor");
// var huff = new House("Hufflepuff");
// var slyth = new House("Slytherin");
// var rav = new House("Ravenclaw");

gryff.addStudent("Harry Potter");
gryff.addStudent("Hermione Granger");
huff.addStudent("Inhak Kim");
huff.addStudent("Randy Latz");
slyth.addStudent("Richard Hessler");
slyth.addStudent("Yi-Hsiao Liu");

gryff.awardPointsTo('Hermione Granger', 20);
gryff.awardPointsTo('Harry Potter', 80);
slyth.awardPointsTo('Richard Hessler', 800);
slyth.awardPointsTo('Yi-Hsiao Liu', 800);
huff.awardPointsTo('Inhak Kim', 20);

var hog = new School("Hogwarts");

hog.addHouses("Gryffindor", "Hufflepuff", "Slytherin", "Ravenclaw");
