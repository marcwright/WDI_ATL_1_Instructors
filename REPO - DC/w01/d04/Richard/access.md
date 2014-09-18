#Morning Exercise

###Array and Hash access

**A. Copy and paste the following data structure into pry:**

`instructors_array = ["Peter", "Greg", "Travis"]`

1. Use pry to access the string `"Peter"`
2. Use pry to add your name to the end of the array?
3. Use pry to remove `"Greg"` from the array.
4. Use pry to access the last item in the array.

**B. Copy and paste the following data structure into pry:**

`vladimir_putins_brain = { :launch_code => "a5Mjp257GHMGH23e5qxE", :fav_hobby => "Riding ponies", "prideful?" => true }`

1. Use pry to return the string `"Riding ponies"`

vladimir_putins_brain[:fav_hobby]

2. Use pry to return the string `"a5Mjp257GHMGH23e5qxE"`

vladimir_putins_brain[:launch_code]

3. Use pry to add the key-value pair `"number_of_wishes" => "three"` to `vladimir_putins_brain`

vladimir_putins_brain["number_of_wishes"] = "three"

4. Use pry to add the key-value pair `4 => "four"`

vladimir_putins_brain[4] = "four"

5. Use pry to remove the key-value pair `"prideful?" => true`

vladimir_putins_brain.delete("prideful?")

**C. Given the following data structure:**

`boolean_hash = { true => "It's true!", false => "It's false" }`

1. What is the return value of `boolean_hash[2 + 2 == 4]`?

  true

2. What is the return value of `boolean_hash["Peter" == "Travis"]`?
  false

3. What is the return value of `boolean_hash[9 > 10]`?

false

4. What is the return value of `boolean_hash[0]`?

    nil

5. What is the return value of `boolean_hash["Greg"]`?

    nil
6. What is the return value of `boolean_hash[false||true]`?

    It's True!

6. What is the return value of `boolean_hash[false||"Travis"]`?
    It's True!

### Arrays & Hashes
**Given the following data structure:**

    users = {
      "Peter" => {
        :github => "peterylai",
        :favorite_numbers => [12, 42, 75]
      },
      "Greg" => {
        :github => "gmac",
        :favorite_numbers => [11, 99, 24]
      },
      "Travis" => {
        :github => "vanderhoop",
        :favorite_numbers => [17, 13, 21]
      }
    }

1. How would you access Travis's Github handle (i.e. the string "vanderhoop")?

    users["Travis"][:github]
2. How would you add the number 7 to Greg's favorite numbers?

    users["Greg"][:favorite_numbers].push(7)

3. How would you add yourself to the users hash?

  users["Richard"] = {}

4. How would you return the array of Peter's favorite numbers?
  users["Peter"][:favorite_numbers]
5. How would you return the smallest of Travis's favorite numbers?

  users["Travis"][:favorite_numbers].min

6. How would you return an array of Greg's favorite numbers that are also even?

  users["Greg"][:favorite_numbers].select{|i| i % 2 == 0}
