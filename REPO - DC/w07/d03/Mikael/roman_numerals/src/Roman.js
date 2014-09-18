function romanize(num) {

  var M = Math.floor( num / 1000 );
  num = num - (M * 1000);
  var D = Math.floor( num / 500 );
  num = num - (D * 500);
  var C = Math.floor( num / 100 );
  num = num - (C * 100);
  var L = Math.floor( num / 50 );
  num = num - (L * 50);
  var X = Math.floor( num / 10 );
  num = num - (X * 10);
  var I = num;

  var numerals = '';

  while (M > 0) {
    numerals += 'M';
    I = I - 1;
  }

  while (D > 0) {
    numerals += 'D';
    D = D - 1;
  }

  while (C > 0) {
    numerals += 'C';
    C = C - 1;
  }

  while (L > 0) {
    numerals = numerals + 'L';
    L = L - 1;
  }

  while (X > 0) {
    numerals = numerals + 'X';
    X = X - 1;
  }

  while (I > 0) {
    numerals = numerals + 'I';
    I = I - 1;
  }

  return numerals;
}
