require_relative "Shelter.rb"
require_relative "Animal.rb"
require_relative "Client.rb"

$happitails = Shelter.new("Happitails")

$happitails.add_animal("Garfield", "Cat")
$happitails.add_animal("Poe", "Cat")
$happitails.add_animal("Rex", "Dog")
$happitails.add_animal("Bing", "Dog")
$happitails.add_animal("Spot", "Dog")


$happitails.add_client("Inhak", "23")
$happitails.add_client("Annalays", "26")
$happitails.add_client("Charlie", "19")
$happitails.add_client("Brian", "25")



