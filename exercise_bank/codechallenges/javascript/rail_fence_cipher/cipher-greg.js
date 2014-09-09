function encode(message) {
  message = message.replace(/[\. ]/g, '');
  var length = message.length;
  var dir = 1;
  var track = 0;
  var numTracks = 2;
  var cipher = [];

  for (var i=0; i < length; i++) {
    cipher[length * track + i] = message[i];
    track += dir;
    if (track <= 0 || track >= numTracks) dir = -dir;
  }
  
  return cipher.join('');
}

var crypt = encode('WE ARE DISCOVERED. FLEE AT ONCE');
console.log(crypt);