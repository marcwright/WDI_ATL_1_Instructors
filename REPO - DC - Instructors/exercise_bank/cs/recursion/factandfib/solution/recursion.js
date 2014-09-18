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

console.log(loopFactorial(5));
console.log(recFactorial(5));

function loopFib(n){
  var first = 0;
  var second = 1;
  var sum;
  for(var i = 2; i <= n; i++){
    sum = first + second;
    first = second;
    second = sum;
  }
  return sum;
}

function recFib(n){
  if (n === 0){
    return 0;
  }
  else if (n === 1){
    return 1;
  }
  else {
    return recFib(n-1) + recFib(n-2);
  }
}

console.log(loopFib(2));
console.log(recFib(2));