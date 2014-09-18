var animal = "badWolf";

function barn() {
  alert(animal); // The wolf got inside the barn!
}

function barn(hole) {
  var animal = hole; // Whoa! wolf went through a hole!
  alert(animal); // "badWolf"
}

var happy = ''; //not sure who's happy right now
function fortifiedBarn(){
  if (true) {
    var animal = ['pig', 'sheep', 'cow'];
  }
  console.log(animal); //where safe inside!!

  var happy = [];
  for (var x = 0; x < animal.length; x++ ) {
    happy.push(animal[x]);
  }

  console.log(happy); // my animals are happy! :)
}

console.log(happy); // 'undefined'... they ain't happy out there

console.log(animal); // "badWolf"...grrr

function shotgun_shoot(){
  this.animal = "dead";
} // wolf will die with this deadly shot

var pistol = new shotgun_shoot(); // changing gun but don't kill animal yet.

console.log(pistol.animal) // 'dead'

console.log(animal); // "badWolf"...grrr

shotgun_shoot(); // BanG!!! 
console.log(animal); // "dead"

