dog1 = Animal.new("Beans!", "dog")
dog2 = Animal.new("Frank", "dog")
cat1 = Animal.new("Patches", "cat")
cat2 = Animal.new("Dunbar", "cat")
snake1 = Animal.new("Nagini", "snake")
# ^^^^^^^^^^^^ THIS IS MY CAT!

person1 = Client.new("Travis", 27)
person2 = Client.new("Mallory", 25)

$happitails = Shelter.new("Happitails")

$happitails.animals << cat2
$happitails.animals << snake1

$happitails.clients << person1
$happitails.clients << person2

person1.add_pet(dog1)
person1.add_pet(dog2)
person2.add_pet(cat1)
