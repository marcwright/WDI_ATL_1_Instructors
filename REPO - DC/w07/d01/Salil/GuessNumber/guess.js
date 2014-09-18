var readline = require('readline');

var rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.question("Please pick a number: ", function(answer) {
  rl.close();
});

console.log(answer)
