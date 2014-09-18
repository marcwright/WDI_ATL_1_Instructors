function initials(name){
  var array = [];
  var collection = name.split(' ');
  for (i=0; i < collection.length; i++){
   array.push(collection[i].charAt(0));
  }
  return array.join('.') + "."
}

