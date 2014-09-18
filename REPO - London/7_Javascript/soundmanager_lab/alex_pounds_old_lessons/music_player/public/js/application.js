// soundManager.setup({
//   url: '/swf/',
//   onready: function() {
//     var mySound = soundManager.createSound({
//       id: 'myFirstSound',
//       url: '/Archers.mp3'
//     });
//     mySound.play();
//   }
// });







var myPlayer = myPlayer || {};


myPlayer.setup = function() {
  var $playButton = $('#playButton');
  $playButton.click(function(ev) {myPlayer.playClickHandler(); });
  $playButton.data('state', 'stopped');

};


myPlayer.play = function() {  
  var $playButton = $('#playButton');
  var song = myPlayer.getSong();

  if ($playButton.data('state') == 'stopped') {
    song.play();
  } else if ($playButton.data('state') == 'paused') {
    song.resume();
  } else {
    console.warn('My player is in an unexpected state: ' + $playButton.data('state'));
  };

  $playButton.html('&#10074;&#10074;');
  $playButton.data('state', 'playing');
};


myPlayer.playClickHandler = function() {
  var $playButton = $('#playButton');
  var song = myPlayer.getSong();


  if ($playButton.data('state') == 'playing') {
    myPlayer.pause();
  } else {
    myPlayer.play();
  }
};

myPlayer.pause = function() {
  var $playButton = $('#playButton');
  var song = myPlayer.getSong();

  song.pause();
  $playButton.html('&#9654;').data('state', 'paused');
};


myPlayer.getSong = function() {
  if (!myPlayer._currentSong) {
    myPlayer._currentSong = soundManager.createSound({
                id: 'songId',
                multiShot: false,
                url: '/Archers.mp3'
    });
  };

  return myPlayer._currentSong;
};

myPlayer._currentSong = null;



$(document).ready(
  soundManager.setup({
    url: '/swf/',
    onready: myPlayer.setup
  })
);



