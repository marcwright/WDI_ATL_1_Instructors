hammonds_mines = { 
  :nicaragua => {
    :depth => "200 meters",
    :annual_budget => 1_500_000,
    :specimens => [
      "Tyrannosaurus Rex", 
      "Stegosaurous", 
      "Triceratops",
      "Velociraptor"
    ]
  },
  :buenos_aires => {
    :depth => "400 meters",
    :annual_budget => 1_000_000,
    :specimens => [
      "Dilophosaurus", 
      "Brachiosaurus"
    ]
  }, 
  :mexico => {
    :depth => "350 meters",
    :annual_budget => 900_000,
    :specimens => [
      "Gallimimus",
      "Parasaurolophus"
    ]
  }
}
#Part 1
puts hammonds_mines[:mexico][:depth]
#Part 2
puts hammonds_mines[:buenos_aires][:annual_budget]
#Part 3
puts hammonds_mines[:nicaragua][:specimens][1]
#part 4
puts hammonds_mines[:nicaragua][:specimens]
#Part 5 
puts hammonds_mines[:mexico][:specimens][1]
#part 6
low_budget_mines = hammonds_mines.values.select {|mine| 
  mine[:annual_budget].to_i <= 1_000_000}

puts low_budget_mines

#Part 7
frog_dna = hammonds_mines[:nicaragua][:specimens].map {|species|
  species + " with a splash of frog DNA"}
  puts frog_dna



