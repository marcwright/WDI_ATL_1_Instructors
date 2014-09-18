function loopFactorial(n){
  var product = 1;
  for(var i = 1; i <= n; i++){
    product *= i;
  }
  return product;
}

function recFactorial(n){
  if (n === 1){
    return 1;
  }
  else {
    return n * recFactorial(n-1);
  }
}

function loopFibonacci(n) {
}

function recFibonacci(n) {
  if (n === 0) {
    return 0;
  } else if (n === 1) {
      return 1;
  } else {
      return recFibonacci(n-1) + recFibonacci(n-2);
  }
}

console.log(loopFactorial(5));
console.log(recFactorial(5));
console.log(recFibonacci(4));
