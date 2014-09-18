# Stephen Stanwood (stephen@stanwoodsolutions.com)

$s = Shelter.new

$s.add_pet(Animal.new("Smokey", "cat"))
$s.add_pet(Animal.new("Oreo", "cat"))
$s.add_pet(Animal.new("Shadow", "cat"))
$s.add_pet(Animal.new("Lucky", "dog"))

$s.add_client(Client.new("Stephen", 24))
$s.add_client(Client.new("Matthew", 22))
$s.add_client(Client.new("Marion", 53))
$s.add_client(Client.new("Ron", 53))
$s.add_client(CatLady.new("Crazy", 120))
