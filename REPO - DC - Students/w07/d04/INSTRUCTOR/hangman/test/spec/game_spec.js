describe("Hangman", function() {
  var game;
  var CHANCES;

  beforeEach(function() {
    game = new Hangman();
    CHANCES = game.chances;
  });


  describe("selectRandomWord", function() {

    it("should return the first word when random is 0.", function() {
      var stub = sinon.stub(Math, 'random').returns(0);
      expect(game.selectRandomWord()).toBe(game.words[0]);
      stub.restore();
    });

    it("should return the last word when random is 1.", function() {
      var stub = sinon.stub(Math, 'random').returns(1);
      expect(game.selectRandomWord()).toBe(game.words[game.words.length-1]);
      stub.restore();
    });

  });

  describe("hasGuess", function() {

    beforeEach(function() {
      game.guesses = ['Z'];
    });

    it("should return true when the game has the guessed letter.", function() {
      expect(game.hasGuess('Z')).toBe(true);
    });

    it("should return false if the game does not yet have the guessed letter.", function() {
      expect(game.hasGuess('X')).toBe(false);
    });
  });

  describe("reset", function() {

    it("should select a new random word for the game.", function() {
      var stub = sinon.stub(game, 'selectRandomWord').returns('inhak');
      game.reset();
      expect(game.word).toBe('inhak');
      stub.restore();
    });

    it("should reset the guesses array.", function() {
      game.guesses = ['X'];
      game.reset();
      expect(game.guesses.length).toBe(0);
    });
  });


  describe("hasWordLetter", function() {
    beforeEach(function() {
      game.word = "volume";
    });

    it("should return true if word has the specified letter.", function() {
      expect(game.hasWordLetter("v")).toBe(true);
    });

    it("should return false if the word does not have the specified letter.", function() {
      expect(game.hasWordLetter("z")).toBe(false);
    });
  });

  describe("guess", function() {
    beforeEach(function() {
      game.word = 'richard';
    });

    it("should add the guessed letter to the guesses array.", function() {
      game.guess('r');
      expect(game.guesses.length).toBe(1);
    });

    it("should take no action after the game is no longer active.", function() {
      game.active = false;
      game.guess('r');
      expect(game.guesses.length).toBe(0);
    });

    it("should decrement chances ramaining when guessing a new failed letter.", function() {
      game.guess('z');
      expect(game.chances).toBe(CHANCES-1);
    });

    it("should not decrement chances when guessing a repeat failed letter.", function() {
      game.guess('z');
      game.guess('z');
      expect(game.chances).toBe(CHANCES-1);
    });

    it("should not decrement chances when guessing a correct letter.", function() {
      game.guess('r');
      expect(game.chances).toBe(CHANCES);
    });

    it("should throw an error when an invalid letter is guessed.", function() {
      expect(function() {
        game.guess('zz');
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
      expect(game.wordDisplay).toBe('_ee_');
    });

    it('should render the full word display when the game is no longer active', function() {
      game.active = false;
      game.update();
      expect(game.wordDisplay).toBe(game.word)
    });

  });

<<<<<<< HEAD
});
=======

  describe("update", function() {

    beforeEach(function() {
      game.word = "sees";
    });


    it("should render the word display based on current guesses while the game is active", function() {
      game.active = true;
      game.guesses = ['e'];
      game.update();
      expect(game.wordDisplay).toBe('_ee_');
    });

    it("should render the full word display when the game is no longer active.", function() {
      game.active = false;
      game.update();
      expect(game.wordDisplay).toBe(game.word);
    });

    it("should resolve victory as true when all letters have been guessed.", function() {
      game.guesses = ['s', 'e'];
      game.update();
      expect(game.victory).toBe(true);
    });

    it("should resolve victory as false when letters are still missing.", function() {
      game.guesses = ['s'];
      game.update();
      expect(game.victory).toBe(false);
    });

    it("should deactive the game when all letters have been guessed.", function() {
      game.guesses = ['s', 'e'];
      game.update();
      expect(game.active).toBe(false);
    });


  });
});
>>>>>>> 237bfdefec1527c1b8fa2bffc69016c73516271b
