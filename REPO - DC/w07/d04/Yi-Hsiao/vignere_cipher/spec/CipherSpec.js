describe( "VigenereCipher", function() {
  var cipher;
  beforeEach(function() {
    cipher = new VigenereCipher( "lemon" );
  });

  describe( "new cipher", function() {
    it ( "should have a cipher keyword", function() {
      expect( cipher.keyword ).toBe( "lemon" );
    });
  });

  describe( "getIndex", function() {
    it( "should return 0 for 'a'", function() {
      expect( cipher.getIndex( "a" ) ).toBe( 0 );
    });

    it( "should return 25 for 'z'", function() {
      expect( cipher.getIndex( "z" ) ).toBe( 25 );
    });
  });

  describe( "encode", function() {

    it( "should encode 'attackatdawn' to 'lxfopvefrnhr'", function() {
      expect( cipher.encode( "attackatdawn" ) ).toBe( "lxfopvefrnhr" );
    });
  });

  describe( "decode", function() {

    it( "should decode 'lxfopvefrnhr' to 'attackatdawn'", function() {
      expect( cipher.decode( "lxfopvefrnhr" ) ).toBe( "attackatdawn" );
    });
  });
});