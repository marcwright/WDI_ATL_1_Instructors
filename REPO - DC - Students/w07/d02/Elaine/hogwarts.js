function Student(name, points) {
  this.name = name;
  this.points = points;
}

Student.prototype = {

  awardPoints: function(points) {

  }
};

var kitten = {
  name: 'mittens',
  friend: puppy,
  introFriend: function() {
    console.log(this);
    this.friend.bark();
    console.log(this);
  }
}
