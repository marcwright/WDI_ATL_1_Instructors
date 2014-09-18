
//========STUDENT============//


function Student(name, points) {
  this.name = name;
  this.points = points;
}

Student.prototype = {

  getName: function() {
    var studentname = this.name;
    return (studentname);
  },
  getPoints: function() {
    return this.points;
  },
  awardPoints: function(morepoints) {
    return (this.points += morepoints);
  }
}

//========HOUSE============//


function House(houseName) {
  this.houseName = houseName;
  this.students = [];
}

House.prototype = {

//adds and returns a new Student object with the specified name.
  addStudent: function(name){
    var added = new Student(name);
    this.students.push(added);
    return added;
  },

//finds and returns a student object with the specified name, or null if they're not defined within the house.
  getStudent: function(name){

    var found = _.find(this.students, name)
    return((found)|| null);
    //BROKEN
  },


//finds and returns a student object with the specified name, or creates and returns the student if they don't exist.
  getOrCreateStudents: function(name){

    var found = _.find(this.students, name)
    return found || new Student(name).push(this.students);
    //BROKEN
  },


//finds a student with the specified name, and awards them the specified number of points. Create the student if they don't already exist.
  awardPointsTo: function(name, points){

    return null;
  },


//tallies all points currently earned among all students in the house.
   getTotalPoints: function(){

    //looks through this.students and adds all points.
    var studentPoints = []
    for this.students function(name){
      name.getPoints.push(studentPoints);
    }

    return Math.sum(studentPoints);
  }
}

//========SCHOOL============//

function School(schoolName) {
  this.schoolName = schoolName;
  this.houses = [];
}

// aka HOGWARTS SCHOOL
School.prototype = {

//adds a new House object with the specified name.
  addHouse: function(name){

    var newHouse = new House(name);
    this.houses.push(newHouse);
    return newHouse;
  },

  //adds a new Houses object for each house name provided as an argument. (adds MANY houses;)
  addHouses: function(name){

    //BROKEN
    return null;
  },

//finds and returns a house with the specified name.
  getHouse: function(houseName){

    var foundHouse = _.find(this.houses, houseName)
    return(foundHouse);
    // BROKEN
  },

//finds and returns an array of the house (or houses) with the highest point totals.
  getLeadingHouses: function(){

//recursively loop through each house's student-roster, looking up points, putting them in a new array, then adding up the array.==>
    var pointsArray = [];
 //   for (this.houses,
 //     return house.houseName;
 //     return sum(house.students.each.getPoints);
 //   )

    return null ;
  }
}



