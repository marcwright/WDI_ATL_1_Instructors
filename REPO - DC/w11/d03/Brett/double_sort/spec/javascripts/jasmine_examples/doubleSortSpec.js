describe("doubleSort", function() {

  it("should sort strings alphabetically", function() {
    var returnValue = doubleSort(["sugar", "butter", "egg"]);
    expect(returnValue).toEqual(["butter", "egg", "sugar"]);
  });

  it("should sort numbers numerically", function() {
    var returnValue = doubleSort(["12", "10", "3", "4", "1"]);
    expect(returnValue).toEqual(["1", "3", "4", "10", "12"]);
  });

  it("should sort words and numbers independently", function() {
    var returnValue = doubleSort(["16", "8", "4", "salt", "baking", "soda"]);
    expect(returnValue).toEqual(["4", "8", "16", "baking", "salt", "soda"]);
  });

  it("should maintain the pattern order of the original array", function() {
    var returnValue = doubleSort(["2", "4", "banana", "1", "vanilla", "flour"]);
    expect(returnValue).toEqual(["1", "2", "banana", "4", "flour", "vanilla"]);
  });
});

// describe("Player", function() {
//   var player;
//   var song;

//   beforeEach(function() {
//     player = new Player();
//     song = new Song();
//   });

//   it("should be able to play a Song", function() {
//     player.play(song);
//     expect(player.currentlyPlayingSong).toEqual(song);

//     //demonstrates use of custom matcher
//     expect(player).toBePlaying(song);
//   });

//   describe("when song has been paused", function() {
//     beforeEach(function() {
//       player.play(song);
//       player.pause();
//     });

//     it("should indicate that the song is currently paused", function() {
//       expect(player.isPlaying).toBeFalsy();

//       // demonstrates use of 'not' with a custom matcher
//       expect(player).not.toBePlaying(song);
//     });

//     it("should be possible to resume", function() {
//       player.resume();
//       expect(player.isPlaying).toBeTruthy();
//       expect(player.currentlyPlayingSong).toEqual(song);
//     });
//   });

//   // demonstrates use of spies to intercept and test method calls
//   it("tells the current song if the user has made it a favorite", function() {
//     spyOn(song, 'persistFavoriteStatus');

//     player.play(song);
//     player.makeFavorite();

//     expect(song.persistFavoriteStatus).toHaveBeenCalledWith(true);
//   });

//   //demonstrates use of expected exceptions
//   describe("#resume", function() {
//     it("should throw an exception if song is already playing", function() {
//       player.play(song);

//       expect(function() {
//         player.resume();
//       }).toThrowError("song is already playing");
//     });
//   });
// });
