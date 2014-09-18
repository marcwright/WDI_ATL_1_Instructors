function VigenereCipher( keyword ) {
  this.keyword = keyword;
}

VigenereCipher.prototype = {
  ALPHABET: 'abcdefghijklmnopqrstuvwxyz',
  getIndex: function( letter ) {
    return this.ALPHABET.indexOf( letter );
  },
  encode: function( message ) {
    var keywordLength = this.keyword.length;

    encryption = [];
    for ( var i = 0; i < message.length; i++ ) {
      // get the keyword index
      // any values greater than the keyword's length wraps to the beginning
      var keywordIndex = i % keywordLength;

      // get the message index and keyword index in the alphabet
      var messageAlphaIndex = this.getIndex( message[i] );
      var keywordAlphaIndex = this.getIndex( this.keyword[keywordIndex] );

      // sum the indices and lookup their corresponding index in the alphabet
      // any values greater than 26 wraps around to the beginning of the alphabet
      encodedIndex = ( messageAlphaIndex + keywordAlphaIndex ) % 26;

      // store their value
      encryption.push( this.ALPHABET[encodedIndex] );
    }

    return encryption.join("");
  },
  decode: function( message ) {
    var keywordLength = this.keyword.length;

    decryption = [];

    // for each letter in the encrypted message
    for ( var i = 0; i < message.length; i++ ) {
      // gets the index of the keyword and makes sure it wraps
      // for a keyword with n chars, the n + 1 char will be the 0th char
      var keywordIndex = i % keywordLength;

      // get the alpha index of the keyword's i-th character
      var keywordAlphaIndex = this.getIndex( this.keyword[keywordIndex] );

      // get the alpha index of the encrypted message's i-th character
      var messageLetter = message[i];
      var encryptedAlphaIndex = this.getIndex( messageLetter );

      // subtract the indices to decrypt the message
      // and add 26 to ensure the value is positive & get the modulus of 26
      decryptedAlphaIndex = ( encryptedAlphaIndex - keywordAlphaIndex + 26 ) % 26;
      decryption.push( this.ALPHABET[decryptedAlphaIndex] );
    }

    return decryption.join("");
  }
};