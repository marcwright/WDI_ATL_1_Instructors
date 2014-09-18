#Morning Exercise

### Learning Objective:
- Deliberate Practice
  - You will be commenting each step of your program **BEFORE YOU CODE IT**, explaining in English A) what you need to do to get the desired output and B) what tools you will use to accomplish your goal.

### Saved By The Bell: The Newest Class
- Create a file called saved_by_the_bell.rb
- Begin with this simple data structure representing your class:
```
students = ["Adam Barrett","Jacob Cain","Mikael Davis","Salil Doshi","Jon Eva","Elaine Fang","Parker Hart","Richard Hessler","Mary Hipp","Inhak Kim","Randy Latz","Yi-Hsiao Liu","Alexi Phillipson","Matt Rundo","Gabe Snyder","Stephen Stanwood","Joella Straley","Brett Wallace","Thomas Weaver"]
```
- Write a program that:
  - beings with a comment identifying what type of data structure `students` is.
  - prints `"STUDENT_NAME is learning to learn."` for every student in the class
  - prints `"STUDENT_NAME is the student in the STUDENTS_INDEX_VALUE index"` for every student in the class
    - What tool will you use? If you don't know, where will you look?
  - Finds and prints the number of students in the class
    - What tool will you use? Again, if you don't know, where will you look?
  - Finds and prints the index of `"Stephen Stanwood"`
  - Prints the fifth person
  - Prints all of the students with J names (Jacob, Jon, and Joella)

### Searching for a Soul Mate
**Copy and paste the following into pry:**

    ok_cupidites = {
      "nicestGuy5530" => {
        :name => "Brad Ladd",
        :in_a_relationship => false,
        :hobbies => ["working out", "seeing concerts", "watching sports", "eating"],
        :seeking => ["friendship", "short-term dating", "a long-term relationship", "anything I can get"]
      },
      "southwesternDave" => {
        :name => "Dave Tacoma",
        :in_a_relationship => false,
        :hobbies => ["bird watching", "cross-country skiing", "When I'm bored I do this thing I call 'friendly' prank calls, where I just call strangers and kinda ask them how they're doing and stuff, in a friendly way"],
        :seeking => ["a long-term relationship", "short-term dating"]
      },
      "WOOTman" => {
        :name => "Jeff Lamplugh",
        :in_a_relationship => true,
        :hobbies => ['improvisational comedy', 'aquacizing', 'private investigation'],
        :seeking => []
      }
    }

1. Use pry to return an array of keys for the `ok_cupidites` hash. (ok_cupidites.keys)
2. Use pry to return whether `southwesternDave` is in a relationship. #look at key "southwesterDave", look at symbol :in_a_relationship if ture or false
3. Use pry to add `watching True Detective` to `WOOTman`'s hobbies. #ok_cupidites["WOOTman"][:hobbies].push("watching True detective")
4. Use pry to return all the things that `nicestGuy5530` is seeking. #ok_cupidites["nicestGuy5530"][:seeking]
5. Use pry to retrieve `southwesternDave`'s third hobby. #ok_cupidites["southwesternDave"][:hobbies][2]
6. In English, explain how would you return an array of only the ok_cupities that are single?

# Look at their user and then look at their value for "in a relationship". If it's false it means they are single
