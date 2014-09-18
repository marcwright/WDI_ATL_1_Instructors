var alphabet = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];

var message = prompt('Enter a word');
var userKey = prompt('Enter a key word');

var key = Array(message.length).join(userKey);
var encrypted = [];

for (var i = 0; i < message.length; i++) {
  var letterTotal = alphabet.indexOf(message[i]) + alphabet.indexOf(key[i]);
  if (letterTotal > 25) {
    letterTotal -= 25;
  }
  encrypted.push(alphabet[letterTotal]);
}
alert("Your encrypted word is " + encrypted.join('').toUpperCase());




