describe("JavaScript Functions", function() {
  var numOne = 5;
  var numTwo = 10;

  // Establish a reference to global scope (this is different between a web browser and NodeJS)
  var GLOBAL = ( typeof window == "undefined" ) ? global : window;

  it( "should be able to call named functions", function() {
    function exampleTest() {
      return 1;
    }

    expect( exampleTest() ).toBe( 1 );
  });

  it( "should accept arguments and return a value when one is explicitly returned", function() {
    function addTwoNums( a, b ) {
      return a + b;
    }

    expect( addTwoNums(numOne, numTwo) ).toBe( 15 );
  });

  it( "should configure an 'arguments' object with all params that were passed to the function", function () {
    function add() {
      var sum = 0;
      for ( var i = 0; i < arguments.length; i++ ) {
        sum += arguments[i];
      }
      return sum;
    }

    expect( add(numOne, numTwo) ).toBe( 15 );
  });

  describe( "scope & closure", function() {
    var outerValue = 10;

    function inner() {
      var innerValue = 20;
      return { innerValue: innerValue, outerValue: outerValue };
    }

    it( "should allow function scopes to reference outward variables", function() {
      expect( inner().outerValue ).toBe( 10 );
    });

    it( "should not allow function scopes to reference nested closures", function() {
      expect( typeof innerValue ).toBe( "undefined" );
    });

    describe( "changing values for scoped variables", function() {
      function doesNotChangeOuterValue( newValue ) {
        var outerValue = newValue;
        return outerValue;
      }

      function changeOuterValue( newValue ) {
        outerValue = newValue;
      }
      
      it( "should be able to change a declared variable inside its scope", function() {
        expect( doesNotChangeOuterValue(20) ).toBe( 20 );
      });
      
      it( "should not be able to change the value of a similarly named variable outside its scope", function() {
        expect( outerValue ).toBe( 10 );
      });

      it( "should be able to change the outer values, if it references the outer variable", function() {
        changeOuterValue( 20 );
        expect( outerValue ).toBe( 20 );
      });
    });

    describe( "IIFE", function() {
      var invoked = false;

      (function() {
        var scopedVar = "cannot see me";
        invoked = true;
      })();

      it( "should call itself", function() {
        expect( invoked ).toBeTruthy();
      });

      it( "should not be able to access variables within its closure", function() {
        expect( typeof scopedVar ).toBe( "undefined" );
      });
    });

    describe( "function declaration, assignment, and hoisting", function() {
      function hoistedDeclarationExample() {
        var hoisted = false;

        try {
          hoistedDeclaration();
          return hoisted;
        } catch(err) {
          return null;
        }

        function hoistedDeclaration() {
          hoisted = true;
        }
      }

      function hoistedAssignmentExample() {
        var hoisted = false;

        try {
          hoistedAssignment();
          return hoisted;
        } catch(err) {
          return null;
        }

        var hoistedAssignment = function() {
          hoisted = true;
        };
      }

      it( "should hoist function declarations to the top of scope", function() {
        expect( hoistedDeclarationExample() ).toBeTruthy();
      });

      it( "should not hoist function assignments", function() {
        expect( hoistedAssignmentExample() ).toBeFalsy();
      });
    });

    describe( "context", function() {

      function functionInvocation() {
        return this;
      }

      var someObject = {
        methodInvocation: function() {
          return this;
        }
      };

      var anotherObject = {};

      var notMethodInvocationAnymore = someObject.methodInvocation;

      function Prototype( value ) {
          this.property = value;
        }

      var instance = new Prototype( "some value" );
      var anotherInstance = new Prototype( "another value" );

      it( "when invoked as a function, should bind to the global scope object", function() {
        var context = functionInvocation();

        expect( context ).toBe( GLOBAL );
      });

      it( "when invoked as a method, should bind to the host object", function() {
        var context = someObject.methodInvocation();

        expect( context ).toBe( someObject );
      });

      it( "when invoked as a function, should bind to the global scope object, regardless of its original declaration", function() {
        var context = notMethodInvocationAnymore();
        
        expect( context ).toBe( GLOBAL );
      });

      it( "when invoked as a call, should bind to the passed object", function() {
        var context = someObject.methodInvocation.call( anotherObject );

        expect( context ).toBe( anotherObject );
      });

      it( "when invoked as a constructor, should bind to the new object instance", function() {

        expect( instance.property ).toBe( "some value" );
        expect( anotherInstance.property ).toBe( "another value" );
      });
    });

    describe( "prototypal inheritance", function() {
      function Drawer() {}

      function personalDrawer() {
        this.stuff = [];
      }
      function sharedDrawer() {}

      Drawer.prototype = {
        addStuff: function( thing ) {
          this.stuff.push( thing );
        }
      };
      personalDrawer.prototype = Drawer.prototype;
      sharedDrawer.prototype = Drawer.prototype;
      sharedDrawer.prototype.stuff = [];

      describe( "personal drawer", function() {
        it( "should only have the items explicitly put in the drawer instance", function() {
          var myDrawer = new personalDrawer();
          var girlfriendsDrawer = new personalDrawer();
          myDrawer.addStuff( "climbing stuff" );
          girlfriendsDrawer.addStuff( "cooking stuff" );

          expect( myDrawer.stuff.length ).toBe( 1 );
          expect( girlfriendsDrawer.stuff.length ).toBe( 1 );
        });
      });

      describe( "shared drawer", function() {
        it( "should share the same items across all drawer instances", function() {
          var myDrawer = new sharedDrawer();
          var girlfriendsDrawer = new sharedDrawer();
          myDrawer.addStuff( "climbing stuff" );
          girlfriendsDrawer.addStuff( "cooking stuff" );

          expect( myDrawer.stuff.length ).toBe( 2 );
          expect( myDrawer.stuff ).toBe( girlfriendsDrawer.stuff );
        });
      });
    });
  });
});