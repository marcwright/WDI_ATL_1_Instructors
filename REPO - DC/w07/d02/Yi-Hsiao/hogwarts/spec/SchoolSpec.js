describe( "School", function() {
  var school;

  beforeEach(function() {
    school = new School();  // always use a fresh instance of House
  });

  describe( "new school instance", function() {
    it( "should start with 0 houses", function() {
      expect( school.houses.length ).toBe( 0 );
    });
  });

  describe( "addHouse", function() {
    var house = "Gryffindor";
    var lastHouseAdded;

    beforeEach(function() {
      school.addHouse( house );
      lastHouseAdded = school.houses.slice(-1)[0];
    });

    it( "should increase the number of houses by 1", function() {
      expect( school.houses.length ).toBe( 1 );
    });

    it( "should increase the number of houses cumulatively", function() {
      school.addHouse( "Slytherin" );
      expect( school.houses.length ).toBe( 2 );
    });

    it( "should add a House object to the 'houses' collection", function() {
      expect( lastHouseAdded instanceof House ).toBeTruthy();
    });

    it( "should add a House with the given name to the 'houses' collection", function() {
      expect( lastHouseAdded.name ).toBe( house );
    });
  });

  describe( "addHouses", function() {
    beforeEach(function() {
      school.addHouses( "Gryffindor", "Slytherin" );
    });

    it( "should add an equal number of houses as were given", function() {
      expect( school.houses.length ).toBe( 2 );
    });

    it( "should increase the number of houses cumulatively", function() {
      school.addHouses( "Another House", "Yet Another House" );
      expect( school.houses.length ).toBe( 4 );
    });

    it( "should add the House names as they were given", function() {
      var houses = [];
      var houseName;
      for ( var i in school.houses ) {
        houseName = school.houses[i].name;
        houses.push( houseName );
      }
      expect( houses ).toEqual( ["Gryffindor", "Slytherin"] );
    });
  });

  describe( "getHouse", function() {
    beforeEach(function() {
      school.addHouses( "Gryffindor", "Slytherin" );
    });

    it( "should return the House object with the given name", function() {
      var houseName = "Gryffindor";

      expect( school.getHouse( houseName ).name ).toBe( houseName );
    });

    it( "should return null, if there is no house matching the given name", function() {
      var houseName = "No House Exists";

      expect( school.getHouse( houseName ) ).toBe( null );
    });
  });

  describe( "getLeadingHouse", function() {
    beforeEach(function() {
      school.addHouses( "Gryffindor", "Slytherin" );
      school.getHouse( "Gryffindor" ).awardPointsTo( "Harry Potter", 100 );
    });

    it( "should return the house with the largest point total", function() {
      expect( school.getLeadingHouse().name ).toBe( "Gryffindor" );
    });

    it( "should return all houses with the largest point total", function() {
      school.getHouse( "Slytherin" ).awardPointsTo( "Draco Malfoy", 100 );

      var leadingHouses = school.getLeadingHouse();
      var houses = [];
      var houseName;
      for ( var i in leadingHouses ) {
        houseName = school.houses[i].name;
        houses.push( houseName );
      }

      expect( houses ).toEqual( ["Gryffindor", "Slytherin"] );
    });
  });
});