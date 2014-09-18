describe( "Student", function() {
  var student;
  var name = "Harry Potter";
  
  var anotherStudent;
  var anotherName = "Ron Weasley";

  beforeEach(function() {
    student = new Student( name );
    anotherStudent = new Student( anotherName );
  });

  describe( "name", function() {
    it( "should have the name that was given when it was initialized", function() {

      expect( student.name ).toBe( name );
    });

    it( "should belong only to its instance", function() {
      expect( student.name ).toBe( name );
      expect( anotherStudent.name ).toBe( anotherName );
    });
  });

  describe( "points", function() {
    it( "should start with 0 points", function() {
      expect( student.points ).toBe( 0 );
    });

    it( "should belong only to its instance", function() {
      anotherStudent.points = 10;

      expect( student.points ).toBe( 0 );
      expect( anotherStudent.points ).toBe( 10 );
    });
  });

  describe( "awardPoints", function() {
    it( "should add a given number of points to a Student's total", function() {
      student.awardPoints( 5 );
      student.awardPoints( 10 );

      expect( student.points ).toBe( 15 );
    });
  });
});
