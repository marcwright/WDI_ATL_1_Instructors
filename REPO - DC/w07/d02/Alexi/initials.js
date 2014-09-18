

// It works?!?
function initials(fname, lname){
  var fname = prompt('What is your first name?');
  var lname = prompt('What is your last name?');
  var finitial = fname.slice(0,1);
  var linitial = lname.slice(0,1); 
}
  console.log(finitial + "." + linitial + ".");

function initials(input){
  var names = input.split(' ');
  var collection = [];
  for(var i = 0; i < names.length; i++){
    collection.push(names[i].charAt(0));
  }
  return collection.join('.') + '.'
}
