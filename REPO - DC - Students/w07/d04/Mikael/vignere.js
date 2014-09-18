var alpha = 'abcdefghijklmnopqrstuvwxyz';

function Vignere() {
  this.message = '',
  this.keyword = '',
  this.ciphertext = '';
}

Vignere.prototype = {
  encrypt: function(message, keyword) {
    this.message = message;
    this.keyword = keyword;
    var newkey = '';

    for (var i = 0; i < message.length; i++){
      newkey += this.keyword[i] % this.keyword.length
    }


    for (var i = 0; i < message.length; i++) {

      var cipherLetter = alpha.indexOf(this.message[i]) + alpha.indexOf(this.newkey[i])

      this.ciphertext += alpha[cipherLetter % 26];
    }
  }
}


var crap = new Vignere();
crap.encrypt('attackatdawn', 'lemon');
console.log(crap.ciphertext);
