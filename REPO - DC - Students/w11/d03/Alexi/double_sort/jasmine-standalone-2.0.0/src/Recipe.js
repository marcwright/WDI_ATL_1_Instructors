function Recipe() {
}

Recipe.prototype.sort = function(array) {
  array.sort(function(a, b) {
      return a - b;
    });  
}
