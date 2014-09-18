function encode( message, keyword ) {
  var result = '';

  for ( var i = 0, len = message.length; i < len; i++ ) {
    var messageChar = message[i].toLowerCase();
    var keywordChar = keyword[i % keyword.length].toLowerCase();

    var mCode = messageChar.charCodeAt( 0 );
    var kCode = keywordChar.charCodeAt( 0 );

    var resCode = ((mCode + kCode - 97 * 2) % 26 + 97);
    result += String.fromCharCode( resCode );
  }

  return result;
}

function decode( encoding, keyword ) {
  var result = '';

  for ( var i = 0, len = encoding.length; i < len; i++ ) {
    var encodingChar = encoding[i].toLowerCase();
    var keywordChar = keyword[i % keyword.length].toLowerCase();

    var eCode = encodingChar.charCodeAt( 0 );
    var kCode = keywordChar.charCodeAt( 0 );

    var resCode = (eCode - 97) - (kCode - 97) + 97;

    // undo the modulo step if that happened
    if ( (eCode - 97) - (kCode - 97) < 0 ) resCode += 26;

    result += String.fromCharCode( resCode );
  }

  return result;
}
