#HappiTails seed data

$shelter_01 = Shelter.new("Happi Tails")

animal01 = Animal.new("Lucy", "dog")
animal02 = Animal.new("Petey", "cat")
animal03 = Animal.new("Roger", "rabbit")
animal04 = Animal.new("Polly", "bird")
$shelter_01.animals.push(animal01,animal02,animal03,animal04)

client01 = Client.new("Mary", "25")
client02 = Client.new("Sarah", "37")
client03 = Client.new("Johnny", "67")
client04 = Client.new("Matilda", "18")
$shelter_01.clients.push(client01, client02, client03, client04)
