# Hogwarts.js

The teachers are getting frustrated at managing house points, and this magic thing just isn't cutting it. Let's use some JavaScript magic to help them out.

Create an object-oriented JavaScript application with three constructor functions: `School`, `House`, and `Student`.

**Requirements:**

1. Create a new HTML document, and include a `hogwarts.js` file. Feel free to include Underscore above it.
 
2. Start by building the smallest object unit (Student) and work your way up to the largest (School).

3. Stay DRY. If you write a behavior twice, you can probably consolidate it.

4. Augment the prototypes of each constructor with the following methods:

## School

* `addHouse(name)`: adds a new House object with the specified name.
* `addHouses(name, …)`: adds a new Houses object for each house name provided as an argument.
* `getHouse(name)`: finds and returns a house with the specified name.
* `getLeadingHouses()`: finds and returns an array of the house (or houses) with the highest point totals.

**Example Usage:**

```
var hogwarts = new School();

hogwarts.addHouse('Gryffindor');
hogwarts.addHouses('Ravenclaw', 'Hufflepuff','Slytherin');

var ravenclaw = hogwarts.getHouse('Ravenclaw');
var leaders = hogwarts.getLeadingHouses();
```

## House

* `addStudent(name)`: adds and returns a new Student object with the specified name.
* `getStudent(name)`: finds and returns a student object with the specified name, or null if they're not defined within the house.
* `getOrCreateStudent(name)`: finds and returns a student object with the specified name, or creates and returns the student if they don't exist.
* `awardPointsTo(name, points)`: finds a student with the specified name, and awards them the specified number of points. Create the student if they don't already exist.
* `getTotalPoints()`: tallies all points currently earned among all students in the house.

**Example Usage:**

```
var gryff = hogwarts.getHouse('Gryffindor');

gryff.addStudent('Harry Potter');
gryff.awardPointsTo('Hermionie Granger', 20);

var total = gryff.getTotalPoints();
```

## Student

* `name`: specifies the name of the student.
* `points`: specifies the number of points the student has earned.
* `awardPoints(points)`: adds the specified number of points to the student's current point to total. 


**Example Usage:**

```
var harry = gryff.getStudent('Harry Potter');
harry.awardPoints(10);
```
