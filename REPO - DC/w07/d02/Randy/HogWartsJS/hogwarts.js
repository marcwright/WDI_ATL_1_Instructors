function Student(name){
  this.name = name;
  this.points = 0;
}

Student.prototype = {
  awardPoints: function(points){
    this.points += points;
  }
}

function House(name){
  this.name = name;
  this.students = [];
}

House.prototype = {
  addStudent: function(name){
    this.students.push(new Student(name));
    return _.findWhere(this.students,{name: name});
  },
  getStudent: function(name){
    return _.findWhere(this.students,{name: name});
  },
  getOrCreateStudent: function(name){
      return this.getStudent(name) || this.addStudent(name);
  },
  awardPointsTo: function(name, points){
    this.getOrCreateStudent(name);
    _.findWhere(this.students,{name: name}).awardPoints(points);
  },
  getTotalPoints: function(){
    return _.reduce(this.students, function(memo, student){
     return memo + student.points;
   }, 0);
  },
}

function School(name){
  this.name = name;
  this.houses = [];
}

School.prototype = {
  addHouse: function(name){
    this.houses.push(new House(name));
    return _.findWhere(this.houses,{name: name});
  },
  addHouses: function(){
    _.each(arguments, function(argument){
      this.addHouse(argument);
    }, this);
  },
  getHouse: function(name){
    return _.findWhere(this.houses,{name: name});
  },
  getLeadingHouses: function(){
    return _.max(this.houses, function(house){
     return house.getTotalPoints();
   });
  }
}




// var huff = new House('Hufflepuff');
// huff.addStudent('Luna');
// huff.awardPointsTo('Luna', 1234);
// huff.addStudent('Banana');
// huff.awardPointsTo('Luna', 4321);

var hog = new School('Hogwarts');
