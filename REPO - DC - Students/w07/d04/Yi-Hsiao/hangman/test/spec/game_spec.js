describe("Hangman", function() {
  var game;

  beforeEach(function() {
    game = new Hangman();
  });

  describe( "selectRandomWord", function() {
    var randomStub;
    afterEach(function() {
      randomStub.restore();
    });

    it( "should return the first word when random is 0", function() {
      randomStub = sinon.stub(Math, "random", function() { return 0; });
      expect( game.selectRandomWord() ).toBe( game.words[0] );
    });

    it ( "should return the last word when random is 1", function() {
      randomStub = sinon.stub(Math, "random", function() { return 1; });
      expect( game.selectRandomWord() ).toBe( game.words.splice(-1)[0] );
    });
  });

  describe( "hasGuess", function() {
    beforeEach(function() {
      game.guesses = ["a"];
    });

    it( "should return true when the game has the guessed letter", function() {
      expect( game.hasGuess("a") ).toBeTruthy();
    });

    it( "should return false when the game does not yet have the guessed letter", function() {
      expect( game.hasGuess("z") ).toBeFalsy();
    });
  });

  describe( "reset", function() {
    var randomWord;

    it( "should select a new random word for the game", function() {
      randomWord = sinon.stub( game, "selectRandomWord", function() { return "new word";});
      game.reset();
      randomWord.restore();

      expect( game.word ).toBe( "new word" );
    });

    it( "should reset the number of guesses for the game", function() {
      game.guesses = ["a"];
      game.reset();

      expect( game.guesses.length ).toBe( 0 );
    });
  });

  describe( "hasWordLetter", function() {
    beforeEach(function() {
      game.word = "word";
    });

    it( "should return true if the given letter is in the word", function() {
      expect( game.hasWordLetter( "w" ) ).toBeTruthy();
    });

    it( "should return false if the given letter is not in the word", function() {
      expect( game.hasWordLetter( "a" ) ).toBeFalsy();
    });
  });

  describe( "guess", function() {
    beforeEach(function() {
      game.word = "guess";
    });

    it( "should add the guess to the guesses array", function() {
      game.guess( "a" );
      expect( game.guesses ).toEqual( ["a"] );
    });

    it( "should take no action, if the game is not active", function() {
      game.active = false;
      game.guess( "a" );
      expect( game.guesses.length ).toBe( 0 );
    });

    it("should ignore case", function() {
      game.guess( "G" );
      expect( game.wordDisplay[0] ).toEqual( "g" );
    });

    describe( "when guessing a correct letter", function() {
      beforeEach(function() {
        game.guess( "g" );
      });


      it( "should add the letter to the displayed word", function() {
        expect( game.wordDisplay[0] ).toEqual( "g" );
      });

      it( "should not add letters to the displayed word if they weren't guessed yet", function() {
        expect( game.wordDisplay[1] ).toEqual( "" );
      });

      it( "should add all matching letters to the displayed word", function() {
        game.guess( "s" );
        expect( game.wordDisplay[3] ).toEqual( "s" );
        expect( game.wordDisplay[4] ).toEqual( "s" );
      });
    });

    describe( "when guessing an incorrect letter", function() {
      var incorrectLetter = "a";
      beforeEach(function() {
        game.guess( incorrectLetter );
      });

      it( "should decrease attempts left by 1", function() {
        expect( game.attemptsLeft ).toBe( game.MAX_ATTEMPTS - 1 );
      });

      it( "should not update attempts left, if a letter has been guessed already", function() {
        game.guess( incorrectLetter );
        expect( game.attemptsLeft ).toBe( game.MAX_ATTEMPTS - 1 );
      });
    });

    describe( "when the user runs out of guesses", function() {
      beforeEach(function() {
        game.attemptsLeft = 1;
        game.guess( "z" );
      });

      it( "should reveal the entire word", function() {
        expect( game.wordDisplay.join("") ).toBe( "guess" );
      });

      it( "should end the game", function() {
        expect( game.active ).toBeFalsy();
      });

      it( "should be a loss", function() {
        expect( game.victory ).toBeFalsy();
      });
    });

    describe( "when the user wins the game", function() {
      beforeEach(function() {
        game.guess("g");
        game.guess("u");
        game.guess("e");
        game.guess("s");
      });

      it( "should reveal the entire word", function() {
        expect( game.wordDisplay.join("") ).toBe( "guess" );
      });

      it( "should end the game", function() {
        expect( game.active ).toBeFalsy();
      });

      it( "should be a loss", function() {
        expect( game.victory ).toBeTruthy();
      });
    });
  });

  describe( "displayWord", function() {
    var randomWordStub;
    beforeEach(function() {
      randomWordStub = sinon.stub( game, "selectRandomWord", function() { return "word"; });
      game.reset();
    });

    it( "should have the same length as the word", function() {
      expect( game.wordDisplay.length ).toBe( 4 );
    });

    it( "should start completely blank", function() {
      expect( game.wordDisplay.join("") ).toBe( "" );
    });
  });
});