var alphabet = "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"

var message = prompt("Enter message:");
var key = prompt("Enter key:");
var cipherArray = [];

while (key.length < message.length) {
  key += key;
}
function encrypt() {
  cipherArray = [];
  for (i=0; i < message.length; i++) {
    var msgLetter = message.charAt(i);
    var msgLetterValue = alphabet.indexOf(msgLetter);

    var keyLetter = key.charAt(i);
    var keyLetterValue = alphabet.indexOf(keyLetter);

    var cipherLetterValue = msgLetterValue + keyLetterValue;

    cipherArray.push(alphabet.charAt(cipherLetterValue));
  }

  console.log(cipherArray.join(""));
  }

function decrypt() {
  cipherArray = [];
  for (i=0; i < message.length; i++) {
    var msgLetter = message.charAt(i);
    var msgLetterValue = alphabet.indexOf(msgLetter);

    var keyLetter = key.charAt(i);
    var keyLetterValue = alphabet.indexOf(keyLetter);

    var cipherLetterValue = msgLetterValue - keyLetterValue;

    if (cipherLetterValue < 0) {
      cipherLetterValue = 26 + cipherLetterValue;
    }

    cipherArray.push(alphabet.charAt(cipherLetterValue));
  }

  console.log(cipherArray.join(""));
}
