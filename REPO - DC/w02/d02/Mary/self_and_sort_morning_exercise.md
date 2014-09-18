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
  # works; executes method self.define because adding self in TITLE makes it a CLASS METHOD; it can work on classes!
  * `madison.define`
  # works; executes method define -- NO SELF because its an instance method not a class method
  * `madison.say_hello`
  # works; puts define; self doesn't matter because its not in title and refers to instance not class; INSTANCE METHOD
  * `madison.say_hello_again`
  # works, puts define, same as above because self is implicit with instance methods

4) Now enter the following and examine the output:
  * `Utopia.define` (Yes, again.)
  # still executes self.define method
  * `Utopia.say_hello`
  # error; undefined method
  * `Utopia.say_hello_again`
  # error; undefined method

### Part II. Arrays, Sorting & Blocks

For the following array, how would I...

```
random_animals = ["porpoise", "camel", "lobster", "kangaroo", "wombat", "chameleon"]
```
* Print out a plural version of each animal on a new line(ie porpoises, camels, etc)
# random_animals.each {|animal| puts animal + "s"}

* Return an array of the animals sorted alphabetically
# random_animals.sort

* Return an array of the animals sorted reverse alphabetically
# random_animals.sort.reverse

* Return an array of the animals with each individual string reversed
# random_animals.map {|animal| animal.reverse}

* Return an array of the animals sorted by word length (low to high)
# random_animals.sort {|animal| animal.length}.reverse

* Return an array of the animals sorted alphabetically by the last character in the string
# random_animals.sort_by {|animal| animal[-1]}

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
# hammonds_mines[:mexico][:depth]

2) Access the annual budget for Hammond's mine in Buenos Aires
# hammonds_mines[:buenos_aires][:annual_budget]

3) Access the stegosaurous.
# hammonds_mines[:nicaragua][:specimens][1]

4) Access the dinosaur DNA specimens found in Nicaragua.
# hammonds_mines[:nicaragua][:specimens]

5) Access the "Parasaurolophus" specimen.
# hammonds_mines[:mexico][:specimens][1]

6) Your budget has been cut. Return an array, `low_budget_mines`, of only the mines with a budget at or below `1_000_000`
# low_budget_mines = hammonds_mines.select {|mine,details| details[:annual_budget] <= 1000000.to_i}

7) Your budget has been re-upped and you've decided you're going to open a park using the DNA specimens found in Nicaragua (they're the most popular). __But there's a big problem__; It's a liability to create dinosaurs that can breed in the wild, so you have to add a dash of asexual frog dna to ensure they can't breed, __but you can't ruin the original specimens__. Thankfully, you have an ace programmer, Dennis Nedrey, who tells you about a hot new array method called `map`, which returns a new array based on another. Create an array of dinosaurs specimens, each "with a dash of asexual frog DNA"."

Example dinosaur: "Tyrannosaurus Rex with a dash of asexual frog DNA"

hammonds_mines[:nicaragua][:specimens].map do |specimen|
  specimen + " with a dash of asexual frog DNA"
end
