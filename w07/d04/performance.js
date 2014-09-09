
function Travis() {
  this.greet = function() {
    return "hello"
  };

  this.eat = function(food) {
    return "yumm";
  };
}



function Travis() {}

Travis.prototype = {
  greet: function() {
    return "hello"
  },

  eat: function(food) {
    return "yumm";
  }
};