function primeFactor( number ) {
  var squareRoot = Math.sqrt( number );
  var maxPossibleFactor = Math.floor( squareRoot );
  var primes = [2];

  for ( var i=2; i<maxPossibleFactor; i++ ) {
    if ( number % i === 0 ) {
      primes.push(i);

      while ( number % i === 0 ) {
        number /= i;
      }
    }
  }

  return primes.pop();
}

primeFactor(600851475143);