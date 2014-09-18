function encode(string) {
  // First row of letters are at index numbers
  // divisible by 4 (0, 4, 8, 12, 16)

  var output = '';

  for (var i = 0; i < string.length; i += 4) {
    output += string[i];
  }

  // Second row of letters are at index numbers
  // 1, 5, 9, 13, 15 (index - 1 is divisble by 4)

  for (var i = 1; i < (string.length); i += 2) {
    output += string[i];
  }

  for (var i = 2; i < (string.length); i += 4) {
    output += string[i];
  }

  return output;
}
