#Morning Exercise

### Part I. The "self" Examination

####1) Take a minute to read through the code snippet below. After you've formed some initial ideas about what's going on, copy and paste it into pry.

```ruby
class Utopia
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def name
    @name
  end

  def self.define
    puts "I am the bodiless notion of a near-perfect society."
    return self
  end

  def define
    puts "I am #{name}, a tangible society that you can reach out and touch in which everyone is content." 
    return self
  end

  def say_hello
    self.define
  end

  def say_hello_again
    define
  end
end
```

2) Still in pry, instantiate a new Utopia object and store it in the variable `madison`

3) Enter the following and examine the output in pry:
  * `Utopia.define`
  * `madison.define`
  * `madison.say_hello`
  * `madison.say_hello_again`

4) Now enter the following and examine the output:
  * `Utopia.define` (Yes, again.)
  * `Utopia.say_hello`
  * `Utopia.say_hello_again`

<<<<<<< HEAD
### Part II. Arrays, Sorting & Slocks
=======
### Part II. Arrays, Sorting & Blocks
>>>>>>> 6085f86bcc7e08775fde0b0b2fd19933b8b24e13

For the following array, how would I...

```
random_animals = ["porpoise", "camel", "lobster", "kangaroo", "wombat", "chameleon"]
```
* Print out a plural version of each animal on a new line(ie porpoises, camels, etc)
* Return an array of the animals sorted alphabetically
* Return an array of the animals sorted reverse alphabetically
* Return an array of the animals with each individual string reversed
* Return an array of the animals sorted by word length (low to high)
* Return an array of the animals sorted alphabetically by the last character in the string

### Part III. Digging for Dinosaurs with John Hammond

```ruby
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
```
1) Access the depth of John Hammond's mine in Mexico.

2) Access the annual budget for Hammond's mine in Buenos Airies

3) Access the stegosaurous.

4) Access the dinosaur DNA specimens found in Nicaragua. 

5) Access the "Parasaurolophus" specimen.

6) Your budget has been cut. Return an array, `low_budget_mines`, of only the mines with a budget at or below `1_000_000`

7) Your budget has been re-upped and you've decided you're going to open a park using the DNA specimens found in Nicaragua (they're the most popular). __But there's a big problem__; It's a liability to create dinosaurs that can breed in the wild, so you have to add a dash of asexual frog dna to ensure they can't breed, __but you can't ruin the original specimens__. Thankfully, you have an ace programmer, Dennis Nedrey, who tells you about a hot new array method called `map`, which returns a new array based on another. Create an array of dinosaurs specimens, each "with a dash of asexual frog DNA"."

Example dinosaur: "Tyrannosaurus Rex with a dash of asexual frog DNA"
