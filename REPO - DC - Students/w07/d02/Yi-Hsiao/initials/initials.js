function initials( name ) {
  var nameWords = name.split(" "); // words in a person's name
  var nameInitials = [];           // initialize array to store person's initials

  var initial;
  for ( var i=0; i < nameWords.length; i++ ) {
    initial = nameWords[i][0];
    nameInitials.push( initial );
  }

  return nameInitials.join(".") + ".";  // return initials with periods, e.g. "Y.L."
}