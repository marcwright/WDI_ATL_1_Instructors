function isPalindrome(string) {
  string = string.toLowerCase().replace(/\s/g, '');
  length = string.length;

  for (i = 0; i < length/2; i++) {
    if (string[i] !== string[length - 1 - i]) {
      return false;
    }
  }

  return true;
}