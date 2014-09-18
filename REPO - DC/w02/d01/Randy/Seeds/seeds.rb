#Animals in the shelter at start.
fido = Animal.new("Fido", "Dog")
fido.toys.push("Tennis Ball","Frisbee")
fluffy = Animal.new("Fluffy", "Cat")
fluffy.toys.push("'Nip", "Dead Mouse")
shelly = Animal.new("Shelly", "Turtle")
shelly.toys.push("Ramp","Plastic Turtle")
blubs = Animal.new("Mr. Blubs", "Goldfish")


#Client Pets
rover = Animal.new("Rover", "Dog")
rover.toys.push("Rope","Baseball")
mittens = Animal.new("Mittens", "Cat")
mittens.toys.push("Rocket Laser", "Stuffed Monkey")
harry = Animal.new("Harry", "Macaw")
harry.toys.push("Blocks", "Bell")



#Shelter Clients
tom = Client.new("Tom", "45")
tom.pets.push(rover)
pam = Client.new("Pam", "24")
pam.pets << mittens
jeremy = Client.new("Jeremy", "17")
jeremy.pets << harry
$totally_legit_shelter = Shelter.new("Totally Legit Animals")
$totally_legit_shelter.animals.push(fido, fluffy, shelly, blubs)
$totally_legit_shelter.clients.push(tom, pam, jeremy)


