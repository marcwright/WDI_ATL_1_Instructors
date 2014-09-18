describe("Hangman", function() {
  var game;
  var CHANCES;

  beforeEach(function() {
    game = new Hangman();
    CHANCES = game.chances;
  });


  describe("selectRandomWord", function() {
    it("should return the first word when random is 0", function() {
      var stub = sinon.stub(Math, 'random').returns(0);
      expect(game.selectRandomWord()).toBe(game.words[0]);
      stub.restore();
    });

    it("should return the last word when random is 1", function() {
      var stub = sinon.stub(Math, 'random').returns(1);
      expect(game.selectRandomWord()).toBe(game.words[game.words.length - 1]);
      stub.restore();
    });


  });

  describe("hasGuess", function() {
    beforeEach(function() {
      game.guesses = ['Z'];
    });

    it("should return true when the game has the guessed letter", function() {
      expect(game.hasGuess('Z')).toBe(true);
    });

    it("should return false if the game does not yet have the guessed letter.", function() {
      expect(game.hasGuess('X')).toBe(false);
    });

  });

  describe("reset", function() {
    it("should select a new random word for the game.", function() {
      var stub = sinon.stub(game, 'selectRandomWord').returns("tyrion");
      game.reset();
      expect(game.word).toBe("tyrion");
      stub.restore();
    });

    it("should reset the guesses array.", function(){
      game.guesses = ['X'];
      game.reset();
      expect(game.guesses.length).toBe(0);
    });

  });

  describe("hasWordLetter", function() {
    beforeEach(function() {
      game.word = "voluptuous";
    });

    it("should return true if word has the specified letter", function() {
      expect(game.hasWordLetter("v").toBe(true));
    });

    it("should return false if the word does not have the specified letter", function() {
      expect(game.hasWordLetter("e").toBe(false));
    });

  });

  describe("guess", function() {
    beforeEach(function() {
      game.word = 'rashida';
    });

    it("should add the guessed letter to the guesses array.", function() {
      game.guess('r');
      expect(game.guesses.length).toBe(1);
    });

    it("should take no action after the game is no longer active.", function() {
      game.active = false;
      game.guess('r');
      expect(game.guesses.length).toBe(1);
    });

    it("should decrement chances remaining when guessing a new failed letter.", function() {

    });

    it("should not decrement chances when guessing a repeat failed letter.");

    it("should not decrement chances when guessing a correct letter.");

  });

  describe("update", function() {
    it("should render the word display based on current guesses while the game is active", function() {
      game.active = true;
      game.guesses = 'e';
      game.update();
      expect(game.wordDisplay).toBe('_ee_');
    });
  })

});
