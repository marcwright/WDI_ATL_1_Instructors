function fibonnaci( max_value ) {
  var a = 1, b = 1;
  var c;

  var sumEvenValues = 0;
  while ( b < max_value ) {
    c = a + b;
    a = b;
    b = c;

    if (c % 2 === 0) {
      sumEvenValues += c;
    }
  }

  return sumEvenValues;
}

fibonnaci(4000000);