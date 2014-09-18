describe( "House", function() {
  var house;
  
  beforeEach(function() {
    house = new House();  // always use a fresh instance of House
  });

  describe( "new house instance", function() {
    it( "should have 0 students", function() {
      expect( house.students.length ).toBe( 0 );
    });
  });

  describe( "addStudent", function() {
    var name = "Harry Potter";
    var anotherName = "Ron Weasley";
    var lastStudentAdded = {};

    beforeEach(function() {
      // add two students to the house
      house.addStudent( name );
      house.addStudent( anotherName );
      lastStudentAdded = house.students.slice(-1)[0];
    });

    it( "should add a Student object to the House instance", function() {
      expect( lastStudentAdded instanceof Student ).toBeTruthy();
    });

    it( "should add a Student object with the given name", function() {
      expect( lastStudentAdded.name ).toBe( anotherName );
    });

    it( "should increase the number of Students by one", function() {
      expect( house.students.length ).toBe( 2 );
    });

    it( "should return a Student object", function() {
      expect( house.addStudent("Some Name") instanceof Student ).toBeTruthy();
    });
  });

  describe( "getStudent", function() {
    var name = "Harry Potter";

    beforeEach(function() {
      house.addStudent( name );
    });

    describe( "when the given name matches a student name", function() {
      it( "should return a Student object", function() {
        expect( house.getStudent( name ) instanceof Student ).toBeTruthy();
      });

      it( "should return a Student object with the given name", function() {
        expect( house.getStudent( name ).name ).toBe( name );
      });
    });

    describe( "when the given name does not match any student name", function() {
      it( "should return null", function() {
        expect( house.getStudent( "no student" ) ).toBe( null );
      });
    });
  });

  describe( "getOrCreateStudent", function() {

    describe( "when the given name matches a student name", function() {
      var name = "Harry Potter";

      beforeEach(function() {
        house.getOrCreateStudent( name );
      });

      it( "should return a Student object", function() {
        expect( house.getStudent( name ) instanceof Student ).toBeTruthy();
      });

      it( "should return a Student object with the given name", function() {
        expect( house.getStudent( name ).name ).toBe( name );
      });

      it( "should not add a new Student", function() {
        expect( house.students.length ).toBe( 1 );
      });
    });

    describe( "when the given name does not match any student name", function() {
      var nobody = "No Name Exists";
      var lastStudentAdded;
      var student;

      beforeEach(function() {
        student = house.getOrCreateStudent( nobody );
        lastStudentAdded = house.students.slice(-1)[0];
      });

      it( "should add a Student object to the House instance", function() {
        expect( lastStudentAdded instanceof Student ).toBeTruthy();
      });

      it( "should add a Student object with the given name", function() {
        expect( lastStudentAdded.name ).toBe( nobody );
      });

      it( "should increase the number of Students by one", function() {
        expect( house.students.length ).toBe( 1 );
      });

      it( "should return a Student object", function() {
        expect( student instanceof Student ).toBeTruthy();
      });
    });
  });

  describe( "awardPointsTo", function() {

    describe( "when the given name matches a student name", function() {
      var name = "Harry Potter";
      var student;
      var points = 20;

      beforeEach(function() {
        student = house.getOrCreateStudent( name );
        house.awardPointsTo( name, points );
      });

      it( "should add the given number of points to the Student that matches the given name", function() {
        expect( student.points ).toBe( points );
      });
    });

    describe( "when the given name does not match any student name", function() {
      var nobody = "No Name Exists";
      var lastStudentAdded;
      var student;
      var points = 20;

      beforeEach(function() {
        house.awardPointsTo( nobody, points );
        lastStudentAdded = house.students.slice(-1)[0];
      });

      it( "should add a Student object to the House instance", function() {
        expect( lastStudentAdded instanceof Student ).toBeTruthy();
      });

      it( "should add a Student object with the given name", function() {
        expect( lastStudentAdded.name ).toBe( nobody );
      });

      it( "should increase the number of Students by one", function() {
        expect( house.students.length ).toBe( 1 );
      });

      it( "should add the given number of points to the new Student instance", function() {
        expect( lastStudentAdded.points ).toBe( 20 );
      });
    });
  });

  describe( "getTotalPoints", function() {
    it( "should return zero if there are no students", function() {
      expect( house.getTotalPoints() ).toBe( 0 );
    });

    it( "should return the total number of points for all students", function() {
      house.awardPointsTo( "a student", 20 );
      house.awardPointsTo( "another student", 15 );

      expect( house.getTotalPoints() ).toBe( 35 );
    });
  });
});