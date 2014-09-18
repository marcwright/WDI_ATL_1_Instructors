# Inheritance | 11:30 - 12:00
- What is "Inheritance"?
  - inherited attributes from parents
  - inherited attributes from ancestors... all the way back to the first reproducing cell

- Programming concepts of inheritance 
  - different languages are slightly different
  - Ruby, as you might expect, is quite flexible
  
- Create a Tetrapod class and subclass Person

- Add some methods, and Pry
  - p = Person.new
  - p.class
  - Person.ancestors

- How do real programming applications implement this?
  BlogPost
  PictureBlog < BlogPost
  TextBlog < BlogPost
  
  Car auction website example:
    - An Auction has many Lots in it
      A Lot can be a Car, or Van, or Boat, or SUV, ...

