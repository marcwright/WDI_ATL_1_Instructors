# Modules / Mixins | 13:00 - 13:45
- 5min review of some of the concepts from earlier
  - Classes can only inherit from one other class - no such thing as multiple inheritance
    - but can keep on inheriting:
      Tetrapod
      Mammal < Tetrapod
      Ape < Mammal
      Human < Ape

- But what if there's behaviour that not *every* subclass of a superclass implements?
  Does every animal fly? 
  Or any mammal lay eggs?
  
- We could say our model is "composed" of all these different types of behaviour; and some programming languages term this as "composition"

- This type of modular behaviour we would term "mix-in", and we use Modules to mix behaviour into our classes.

- Module is like a class that you can't instanciate.

- Pry
  Person.new.say("Hello") # nope
  Person.include Talkable # nope - error
    - side-bar on private/public/protected
  Person.send(:include, Talkable)
  Person.new.say("Hello") # 'I say: hello'
  
  same as adding:
    "include Talkable" in the code

  Person.ancestors 
    
- If time:
  Comment-out the include, and show extend on an instance
  Show a conditional extend

- Move modules and classes to their own files.
  require/require_relative