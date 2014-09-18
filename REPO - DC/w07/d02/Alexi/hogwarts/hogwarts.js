//============================//
//============================//
function Student(name, points) {
  this.name = name;
  this.points = (points || 0);
}
Student.prototype = {
  awardPoints: function(points) {
    return this.points += points;
  }
}
//============================//
function House(house) {
  this.house = house;
  this.students = [];
}
House.prototype = {
  addStudent : function(name){
    var student = new Student(name);
    this.students.push(student);
    return student;
  },
  getStudent : function(name){
    return _.findWhere(this.students, {name: name});
  },
  getOrCreateStudent : function(name){
    return this.getStudent(name) || this.addStudent(name);
  },
  awardPointsTo : function(name, points){
    var stuPoints = this.getOrCreateStudent(name);
    stuPoints.awardPoints(points);
    return stuPoints;
  },
  getTotalPoints : function(){
    return _.reduce(this.students, function(memo, student) {
      return memo + student.points;
    }, 0);
  }
} // END of House.prototype
//============================//
function School(school) {
  this.school = school;
  this.houses = [];
}
School.prototype = {
  addHouse : function(houseName) {
    var house = new House(houseName);
    this.houses.push(houseName);
    return house;
  },
  addHouses : function(houseNames) {
    var schools = houseNames.split(',');
    for (var i = 0; i < schools.length; i++);
      this.houses.push(schools[i]);
  } // Not working...
} // END of School.prototype


//============================//
//=========Seed Data==========//
//============================//
// var grif = new House('Gryffindor');
// var slytherin = new House('Slytherin');

// var hermione = grif.addStudent('Hermione');
// var harry = grif.addStudent('Harry');
// var severus = slytherin.addStudent('Severus');

var hogwarts = new School();
hogwarts.addHouse('Ravenclaw');
// hogwarts.addHouses('Ravenclaw', 'Gryffindor', 'Slytherin', 'HufflePuff');

// hermione.awardPoints(100);
// harry.awardPoints(22);
// severus.awardPoints(10);
//============================//
