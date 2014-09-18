describe("Hangman", function() {
  var game;
  var CHANCES;

  beforeEach(function() {
    game = new Hangman();
    CHANCES = game.chances;
  });



  describe ('selectRandomWord', function() {
    it ('should return the first word when random is 0',function() {
      var stub = sinon.stub(Math, 'random').returns(0);
      expect( game.selectRandomWord() ).toBe(game.words[0]);
      stub.restore();
    });

    it ('should return the last word when random is 1',function(){
      var stub = sinon.stub(Math, 'random').returns(1);
      expect( game.selectRandomWord() ).toBe(game.words[game.words.length-1]);
      stub.restore();
    });
  });

  describe ('hasGuess', function() {
    beforeEach(function() {
      game.guesses = ['Z'];
    });
    it('should return true when the game has the guess letter', function() {
      expect(game.hasGuess('Z')).toBe(true);
    });

    it('should return false when the game does not yet have the letter guessed yet', function() {
      expect(game.hasGuess('X')).toBe(false);
    });
  });

  describe ('reset', function() {
    it('should select a new random word for the game', function() {
      var stub = sinon.stub(game, 'selectRandomWord').returns('inhak');
      game.reset();
      expect( game.word ).toBe('inhak');
      stub.restore();
    });

    it('should reset the guesses array', function() {
      game.guesses = ["X"];
      game.reset();
      expect(game.guesses.length).toBe(0);
    });
  });

  describe ('hasWordLetter', function() {
    it ("should return true if the letter is in the word", function() {
      var stub = sinon.stub(game, 'selectRandomWord').returns('scope');
      expect( game.hasWordLetter("c")).toBe(true);
      stub.restore();
    });
    it ("should return false if the letter isn't in the word", function() {
      var stub = sinon.stub(game, 'selectRandomWord').returns('scope');
      expect( game.hasWordLetter("x")).toBe(false);
      stub.restore();
    });
  });

  describe ('guess', function() {
    beforeEach(function() {
      game.word = 'richard';
    });
    it('should add the guessed letter to the guesses array', function() {
      game.guess('r');
      expect( game.guesses.length ).toBe(1);
    });
    it('should take no action after the game is no longer active', function() {
      game.active = false;
      game.guess('r')
      expect( game.guesses.length ).toBe(0);
    });
    it('should decrement chances remaining when guessing a new failed letter', function() {
      game.guess('z');
      expect( game.chances ).toBe(CHANCES-1);
    });
    it('should not decrement chances remaining when guessing a repeat failed letter', function() {
      game.guess('z');
      game.guess('z');
      expect( game.chances ).toBe(CHANCES-1);
    });
    it('should not decrement chances remaining when guessing a correct letter', function() {
      game.guess('r');
      expect( game.chances ).toBe(CHANCES);
    });
    it('should throw an error when an invalid letter is guessed', function() {
      expect(function() {
        game.guess('fj');
      }).toThrow();
    });

  });

  describe('update', function() {
    beforeEach(function() {
      game.word = 'sees';
    });
    it('should render the word display based on current guesses while the game is active', function() {
      game.active = true;
      game.guesses = ['e'];
      game.update();
      expect( game.wordDisplay ).toBe('_ee_');
    });

    it('should render the full word display when the game is no longer active', function() {
      game.active = false;
      game.update();
      expect( game.wordDisplay ).toBe('sees')
    });

    it('should resolve victory as true when all letters have been guessed', function() {
      game.guesses = ['s','e'];
      game.update();
      expect( game.victory ).toBe(true);
    });

    it('should resolve victory as false when letters are still missing', function() {
      game.guesses = ['s'];
      game.update();
      expect( game.victory ).toBe(false);
    });

    it('should deactivate the game when all letters have been guessed', function() {
      game.guesses = ['s','e'];
      game.update();
      expect( game.active ).toBe(false);
    });

  });


});
