function Student(name){
  this.name = name;
  this.points = 0;
}

Student.prototype = {
  addPoints: function(points) {
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
  },

  getStudent: function(name){
    return _.findWhere(this.students, {name: name});
  },

  getOrCreateStudent: function(name){
    return this.getStudent(name) || this.addStudent(name);
  },

  awardPointsTo: function(name, points){
    this.getOrCreateStudent(name).addPoints(points);
    return points + " for " + name;
  },

  getTotalPoints: function(){
    return _.reduce(this.students, function(memo, student){
      return memo + student.points}, 0);
  }
}

function School(name){
  this.name = name;
  this.houses = [];
}

School.prototype = {
  addHouse: function(name){
    this.houses.push(new House(name));
  },

  addHouses: function(){
    for(var i = 0; i < arguments.length; i++){
    this.houses.push(new House(arguments[i]));
    }
  },

  getHouse: function(name){
    return _.findWhere(this.houses, {name: name});
  },

  getLeadingHouses: function(){
    return _.max(this.houses, function(house){
      return house.getTotalPoints();
    });
  }
}


hog = new School("Hogwarts");
hog.addHouses("Hufflepuff", "Gryffindor", "Slytherin");
hog.getHouse("Hufflepuff").addStudent("Cedric Diggory");
hog.getHouse("Hufflepuff").addStudent("Leanne");
hog.getHouse("Hufflepuff").addStudent("Nymphadora Tonks");
hog.getHouse("Gryffindor").addStudent("Harry Potter");
hog.getHouse("Gryffindor").addStudent("Hermione Granger");
hog.getHouse("Gryffindor").addStudent("Ron Weasley");
hog.getHouse("Gryffindor").awardPointsTo("Ron Weasley", 25);
hog.getHouse("Hufflepuff").awardPointsTo("Cedric Diggory", 25);
hog.getHouse("Hufflepuff").awardPointsTo("Leanne", 25);
hog.getHouse("Gryffindor").awardPointsTo("Hermione Granger", 25);
