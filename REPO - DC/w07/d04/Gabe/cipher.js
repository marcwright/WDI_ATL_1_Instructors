var alpha = 'abcdefghijklmnopqrstuvwxyz';
var key = 'lemon';
var secret = 'attackatdawn';
var keyerized = "";
var secretLength = secret.length;
var keyLength = key.length;



while (secretLength > keyLength) {
  keyerized += key;
  secretLength -= keyLength;
}

keyerized += key.substr(0, (secretLength));

console.log(keyerized)
