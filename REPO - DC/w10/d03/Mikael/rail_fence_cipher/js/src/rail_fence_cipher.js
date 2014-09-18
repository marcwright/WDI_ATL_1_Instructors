var encode = function(string) {
  var rows = [];
  var rails = 3;

  for (var i = 0; i < string.length; i++) {
    // add first letter to first row
    rows[0] += string[i];
    // add second letter to second row
    // add third letter to third row
    // add next letter to second row
    // oscillate between first and third rows
  }

  return rows.join();
}
