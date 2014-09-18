function calc() {
  var first    = false,
      operator = false;

  if (first == false) {
    first = prompt("What is your first number");

    if (first != false) {

      operator = prompt("What do you want to do? (s)quare / (c)ube / (a)rea");
      if (operator != null) {
        switch(operator){
          case "s":
            alert("The answer is "+ first * first);
            break;
          case "c":
            alert("The answer is "+ first * first * first);
            break;
          case "a":
            var first = prompt("What is your second number");
            alert("The answer is "+ first * second);
            break;
        }
        first = false

      } else {
        alert('Exitting Calculator...');
      }
      
    } else {
      alert('Exitting Calculator...');
    }
  }
}