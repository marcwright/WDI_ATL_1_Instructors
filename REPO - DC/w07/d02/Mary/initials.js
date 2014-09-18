function initals(name) {
  var splitName = name.split(' ');
  var collection = [];
  for(var i = 0; i <= splitName.length, i++) {
    collection.push(splitName[i](0));
  }
  return collection.join()
}

var initials = function(name) {
  var splitName = name.split(" ")
  splitName.forEach(function(name) {
    console.log(name[0])
  })
}
